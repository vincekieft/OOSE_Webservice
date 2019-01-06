import 'package:OOSE/ORM/ORM.dart';

class DB{
  static ORM _orm;

  static void Initialize() async{
    _orm = new ORM(
        new MysqlAdapter(),
        "127.0.0.1",
        3306,
        "Test",
        "root",
        "123456"
    );

    await _orm.Connect();
  }

  static ORM get orm => _orm;
}