import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Result/QueryParser.dart';
import 'package:OOSE/ORM/src/Result/QueryResult.dart';

abstract class AAction<T>{

  // Private variables
  ORM _orm;

  AAction(ORM orm){
    _orm = orm;
  }

  // Public methods
  Future<QueryResult> CallResult() async{
    String query = await BuildQuery();
    return await ExecuteQuery(query);
  }

  Future<List<T>> Call() async{
    QueryResult result = await CallResult();
    return new QueryParser<T>(result, _orm).ParseQuery();
  }

  Future<T> CallSingle() async{
    List<T> results = await Call();
    if(results.length > 0){ return results.first; }
    return null;
  }

  Future<QueryResult> ExecuteQuery(String query) async{
    return await _orm.ExecuteQueryResult(query);
  }


  // Abstract methods
  Future<String> BuildQuery();

  // Getters
  dynamic get ModelType => T;
  ORM get Orm => _orm;
}