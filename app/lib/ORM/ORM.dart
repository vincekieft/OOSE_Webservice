import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/DatabaseActions/FindCollectionAction.dart';
import 'package:OOSE/ORM/src/DatabaseAdapters/IDatabaseAdapter.dart';
import 'package:OOSE/ORM/src/QueryBuilder/ORMQueryBuilder.dart';
import 'package:OOSE/ORM/src/Result/QueryResult.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';

export 'src/DatabaseAdapters/MysqlAdapter.dart';

class ORM{

  // Private variables
  IDatabaseAdapter _adapter  = null;
  String _host;
  int _port;
  String _db;
  String _user;
  String _password;
  Map<Type, RuntimeClassReflection> _reflections  = new Map<Type, RuntimeClassReflection>();

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

  Future<T> PersistResult<T>(dynamic model) async{
    int lastID = await Persist(model);
    if(lastID >= 0){
      return await Find<T>(lastID);
    }
    return null; // ID does not exist
  }

  ORMQueryBuilder StartQuery<T>(){
    return new ORMQueryBuilder<T>(this);
  }

  Future<int> Persist(dynamic model) async{
    //return await new InsertAction(model.runtimeType, this).Call(model);
  }

  Future<List<T>> FindCollection<T>(QueryBuilder baseBuilder){

  }

  Future<T> Find<T>(int id) async {
    return (await new FindCollectionAction<T>(this).Call()).first;
    //return await new FindAction<T>(this).Call().first;
  }

  void Delete(){

  }

  void Update(){

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
}