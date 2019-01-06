import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Result/QueryParser.dart';
import 'package:OOSE/ORM/src/Result/QueryResult.dart';

abstract class AAction<T>{

  // Private variables
  ORM _orm;
  ClassMirror _mirror;

  AAction(ORM orm){
    _orm = orm;
    _mirror = reflectClass(T);
  }

  // Public methods
  Future<List<T>> Call() async{
    String query = BuildQuery();
    QueryResult result = await _ExecuteQuery(query);
    return new QueryParser<T>(result, _orm).ParseQuery();
  }

  // Abstract methods
  String BuildQuery();

  // Private methods
  Future<QueryResult> _ExecuteQuery(String query) async{
    return await _orm.ExecuteQueryResult(query);
  }

  // Getters
  dynamic get ModelType => T;
  ORM get Orm => _orm;
  ClassMirror get Mirror => _mirror;
}