library QueryBuilder;

import 'dart:mirrors';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/InsertSection.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/JoinSection.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/WhereSection.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/SelectSection.dart';
import 'src/Utils/ArrayUtils.dart';

export 'package:OOSE/QueryBuilder/src/QuerySections/WhereSection.dart';
export 'package:OOSE/QueryBuilder/src/QuerySections/SelectSection.dart';
export 'package:OOSE/QueryBuilder/src/QuerySections/InsertSection.dart';

class QueryBuilder{

  // Private variables
  Map<Type, IWritable> _sections = new Map<Type, IWritable>();
  List<String> _table = new List<String>();

  QueryBuilder(String table){
    _AddTargetTable(table);
  }

  // Section methods
  SelectSection Select(){
    return _ensureSection<SelectSection>();
  }

  WhereSection Where(){
    return _ensureSection<WhereSection>();
  }

  InsertSection Insert(){
    return _ensureSection<InsertSection>();
  }

  JoinSection LeftJoin(String table){
    return Join(table, "LEFT JOIN");
  }

  JoinSection RightJoin(String table){
    return Join(table, "RIGHT JOIN");
  }

  JoinSection InnerJoin(String table){
    return Join(table, "INNER JOIN");
  }

  JoinSection OuterJoin(String table){
    return Join(table, "OUTER JOIN");
  }

  JoinSection Join(String table, String type){
    int tableIndex = _AddTargetTable(table);
    return _ensureSectionArgs<JoinSection>([type, tableIndex, this]);
  }

  // Get methods
  String GetTable(int index){
    return _table[index];
  }

  // Private methods
  int _AddTargetTable(String table){
    if(!_table.contains(table)) {
      _table.add(table);
    }
    return _table.indexOf(table);
  }

  // Get / Set
  String get RootTable{
    return _table.first;
  }

  // Private methods
  T _ensureSection<T extends IWritable>(){
    return _ensureSectionArgs<T>([this]);
  }

  T _ensureSectionArgs<T extends IWritable>(List args){
    Type type = T;
    if(!_sections.containsKey(type)) {
      ClassMirror mirror = reflectClass(type);
      _sections[type] = mirror.newInstance(const Symbol(''), args).reflectee as T;
    }
    return _sections[type];
  }

  // Write Query
  String Write([semicolon = true]){
    String query = "${ArrayUtils.JoinMapWritables(_sections, " ")}";
    if(semicolon){query += ";";}
    return query;
  }

  String WriteAsSubquery(){
    return "(${Write(false)})";
  }
}