library QueryBuilder;

import 'dart:mirrors';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/InsertSection.dart';
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
    _table.add(table);
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

  // Modification methods
  QueryBuilder AddTargetTable(String Table){

  }

  // Get / Set
  String get RootTable{
    return _table.first;
  }

  // Private methods
  T _ensureSection<T extends IWritable>(){
    Type type = T;
    if(!_sections.containsKey(type)) {
      ClassMirror mirror = reflectClass(type);
      _sections[type] = mirror.newInstance(const Symbol(''), [this]).reflectee as T;
    }
    return _sections[type];
  }

  // Write Query
  String Write(){
    return ArrayUtils.JoinMapValues(_sections, " ");
  }
}