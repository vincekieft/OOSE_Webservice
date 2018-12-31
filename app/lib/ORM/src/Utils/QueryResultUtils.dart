import 'dart:mirrors';

import 'package:OOSE/ORM/src/Result/QueryResult.dart';
import 'package:OOSE/ORM/src/Result/QueryRow.dart';

class QueryResultUtils{
  static List<dynamic> ConvertResultTo<T>(QueryResult result, Type type){
    List<dynamic> models = new List<dynamic>();
    result.Rows.forEach((row) => models.add(ConvertRowTo(result, row, type)));
    return models;
  }

  static dynamic ConvertRowTo(QueryResult result, QueryRow row, Type type){
    // Get mirrors
    ClassMirror classMirror = reflectClass(type);

    // Init / mirror instance of generic T
    dynamic genericInstance = classMirror.newInstance(const Symbol(''), []).reflectee;
    InstanceMirror genericMirror = reflect(genericInstance);

    // Fill T data
    for(String key in row.values.keys){
      genericMirror.setField(new Symbol("${key}"), row.values[key]);
    }

    return genericMirror.reflectee;
  }
}