import 'dart:mirrors';

import 'package:OOSE/ORM/src/Adapters/IDatabaseAdapter.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';

export 'src/Adapters/MysqlAdapter.dart';

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

  void Insert(dynamic model){
    InstanceMirror mirror = reflect(model);
    var decs = mirror.type.declarations;
    Map<String,DeclarationMirror> testie = new Map();

    for (DeclarationMirror v in decs.values) {
      testie[MirrorSystem.getName(v.simpleName)] = v;
    }

    QueryBuilder builder = new QueryBuilder(model.runtimeType.toString());
    InsertSection ins = builder.Insert();

    for(String key in testie.keys){
     if(testie.containsKey("_${key}")){
       ins.AddValue(key, mirror.getField(new Symbol(key)).reflectee);
     }
    }

    _adapter.Execute(builder.Write());

  }

  void Delete(){

  }

  void Update(){

  }

  void Find(){

  }

  // Getters
  String get Host => _host;
  int get Port => _port;
  String get Database => _db;
  String get User => _user;
}