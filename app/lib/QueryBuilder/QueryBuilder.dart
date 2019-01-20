library QueryBuilder;

import 'dart:mirrors';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/DeleteSection.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/InsertSection.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/JoinSection.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/UpdateSection.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/WhereSection.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/SelectSection.dart';
import 'src/Utils/ArrayUtils.dart';

export 'package:OOSE/QueryBuilder/src/QuerySections/WhereSection.dart';
export 'package:OOSE/QueryBuilder/src/QuerySections/SelectSection.dart';
export 'package:OOSE/QueryBuilder/src/QuerySections/InsertSection.dart';
export 'package:OOSE/QueryBuilder/src/QuerySections/JoinSection.dart';

class QueryBuilder{

  // Private variables
  Map<String, IWritable> _sections = new Map<String, IWritable>();
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

  UpdateSection Update(){
    return EnsureSection<UpdateSection>();
  }

  DeleteSection Delete(){
    return EnsureSection<DeleteSection>();
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
    JoinSection join = _ensureSectionArgs<JoinSection>([type, tableIndex, this], table);
    return join;
  }

  T EnsureSection<T extends IWritable>([String extra = ""]){
    return _ensureSectionArgs<T>([this], extra);
  }

  int EnsureTable(String table){
    if(!Tables.contains(table)){ Tables.add(table); }
    return Tables.indexOf(table);
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

  T _ensureSectionArgs<T extends IWritable>(List args, [String extraIdentifier = ""]){
    Type type = T;
    String identifier = type.toString() + extraIdentifier;
    if(!_sections.containsKey(identifier)) {
      ClassMirror mirror = reflectClass(type);
      _sections[identifier] = mirror.newInstance(const Symbol(''), args).reflectee as T;
    }
    return _sections[identifier];
  }

  // Get / Set
  String get RootTable => _table.first;
  List<String> get Tables => _table;

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