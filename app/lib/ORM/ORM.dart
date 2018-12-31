import 'dart:mirrors';

import 'package:OOSE/ORM/src/DatabaseActions/InsertAction.dart';
import 'package:OOSE/ORM/src/DatabaseAdapters/IDatabaseAdapter.dart';
import 'package:OOSE/ORM/src/Result/QueryResult.dart';
import 'package:OOSE/ORM/src/RuntimeModeReflection/RuntimeColumn.dart';
import 'package:OOSE/ORM/src/Utils/QueryResultUtils.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'src/RuntimeModeReflection/RuntimeTypeReflection.dart';

export 'src/DatabaseAdapters/MysqlAdapter.dart';

class ORM{

  // Private variables
  IDatabaseAdapter _adapter  = null;
  String _host;
  int _port;
  String _db;
  String _user;
  String _password;

  ORM(IDatabaseAdapter adapter,
      String host,
      int port,
      String db,
      String user,
      String password
      ){
    _adapter = adapter;
    _host = host;
    _port = port;
    _db = db;
    _user = user;
    _password = password;
  }

  // Public methods
  void Connect() async{
    await _adapter.Connect(Host, Port, Database, User, _password);
    print("Successfully connected to database: ${Database}, ${User} on http://${Host}:${Port}!");
  }

  void Disconnect(){
    _adapter.Disconnect();
  }

  void Persist(dynamic model)async{
    await new InsertAction(model, this).Call();
  }

  void Delete(){

  }

  void Update(){

  }

  Future<List<T>> Execute<T>(String query) async{
    List<dynamic> dynamicResults = await ExecuteDynamic(query, T);
    List<T> typeResults = new List<T>();
    dynamicResults.forEach((result)=> typeResults.add(result as T));
    return typeResults;
  }

  Future<List<dynamic>> ExecuteDynamic(String query, Type type) async{
    return QueryResultUtils.ConvertResultTo(await _adapter.Execute(query), type);
  }

  Future<QueryResult> ExecuteQueryResult(String query) async{
    return await _adapter.Execute(query);
  }

  // Getters
  String get Host => _host;
  int get Port => _port;
  String get Database => _db;
  String get User => _user;
}