import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/DatabaseActions/DeleteAction.dart';
import 'package:OOSE/ORM/src/DatabaseActions/InsertAction.dart';
import 'package:OOSE/ORM/src/DatabaseActions/UpdateAction.dart';
import 'package:OOSE/ORM/src/DatabaseAdapters/IDatabaseAdapter.dart';
import 'package:OOSE/ORM/src/QueryBuilder/ORMQueryBuilder.dart';
import 'package:OOSE/ORM/src/Result/QueryResult.dart';

export 'src/DatabaseAdapters/MysqlAdapter.dart';
export 'src/Annotations/Column.dart';
export 'src/Annotations/Association.dart';
export 'src/Annotations/HasMany.dart';
export 'src/Annotations/HasOne.dart';
export 'src/Annotations/Primary.dart';
export 'src/Annotations/Table.dart';
export 'src/QueryBuilder/ORMQueryBuilder.dart';
export 'src/QueryBuilder/ORMSelectSection.dart';

class ORM{

  // Private variables
  IDatabaseAdapter _adapter  = null;
  String _host;
  int _port;
  String _db;
  String _user;
  String _password;
  bool _printQueries;
  Map<Type, RuntimeClassReflection> _reflections  = new Map<Type, RuntimeClassReflection>();

  ORM(IDatabaseAdapter adapter,
      String host,
      int port,
      String db,
      String user,
      String password,
      [bool printQueries = false]
      ){
    _adapter = adapter;
    _host = host;
    _port = port;
    _db = db;
    _user = user;
    _password = password;
    _printQueries = printQueries;
  }

  // Public methods
  void Connect() async{
    await _adapter.Connect(Host, Port, Database, User, _password);
    print("Successfully connected to database: ${Database}, ${User} on http://${Host}:${Port}!");
  }

  void Disconnect(){
    _adapter.Disconnect();
  }

  ORMQueryBuilder StartQuery<T>(){
    return new ORMQueryBuilder<T>(this);
  }

  Future<T> Persist<T>(dynamic model) async{
    return await new InsertAction<T>(model, this).CallSingle();
  }

  void Delete(dynamic model){
    new DeleteAction(model, this).CallResult();
  }

  void Update(dynamic model){
    new UpdateAction(model, this).CallResult();
  }

  Future<QueryResult> ExecuteQueryResult(String query) async{
    if(query.length <= 0){return null;} // Early exit when query is empty
    return await _adapter.Execute(query);
  }

  void EnsureRuntimeReflection(Type type){
    if(!_reflections.containsKey(type)){
      _reflections[type] = new RuntimeClassReflection(type, this);
      _reflections[type].Initialize();
    }
  }

  RuntimeClassReflection GetRuntimeReflectionTable(String table){
    for (RuntimeClassReflection reflection in _reflections.values) {
      if(reflection.TableAnnotation.Identifier == table){ return reflection; }
    }
    return null;
  }

  RuntimeClassReflection GetRuntimeReflection(Type type){
    EnsureRuntimeReflection(type);
    return _reflections[type];
  }

  // Getters
  String get Host => _host;
  int get Port => _port;
  String get Database => _db;
  String get User => _user;
  bool get PrintQueries => _printQueries;
}