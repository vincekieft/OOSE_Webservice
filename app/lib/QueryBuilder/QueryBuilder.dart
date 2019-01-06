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
export 'package:OOSE/QueryBuilder/src/QuerySections/JoinSection.dart';

class QueryBuilder{

  // Private variables
  Map<Type, IWritable> _sections = new Map<Type, IWritable>();
  List<String> _table = new List<String>();

  QueryBuilder([String table = null]){
    if(table != null){ _AddTargetTable(table); }
  }

  // Section methods
  SelectSection Select(){
    return EnsureSection<SelectSection>();
  }

  WhereSection Where(){
    return EnsureSection<WhereSection>();
  }

  InsertSection Insert(){
    return EnsureSection<InsertSection>();
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

  T EnsureSection<T extends IWritable>(){
    return _ensureSectionArgs<T>([this]);
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

  T _ensureSectionArgs<T extends IWritable>(List args){
    Type type = T;
    if(!_sections.containsKey(type)) {
      ClassMirror mirror = reflectClass(type);
      _sections[type] = mirror.newInstance(const Symbol(''), args).reflectee as T;
    }
    return _sections[type];
  }

  // Get / Set
  String get RootTable{
    return _table.first;
  }

  // Write Query
  String Write([semicolon = true]){
    if(_sections.length <= 0){semicolon = false;} // Disable adding semicolon when query will be empty
    String query = "${ArrayUtils.JoinMapWritables(_sections, " ")}";
    if(semicolon){query += ";";}
    return query;
  }

  String WriteAsSubquery(){
    return "(${Write(false)})";
  }
}