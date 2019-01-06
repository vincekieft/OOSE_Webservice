import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/Router/Router.dart';

import '../Database/DB.dart';
import '../Models/User.dart';

class TestRoute implements IController, IGetRequest{

  @override
  String path() {
    return "user/:id";
  }

  @override
  Future<Object> GET(Map<String,dynamic> args) async{
    ORMQueryBuilder<User> builder = DB.orm.StartQuery<User>();
    builder.Where().Equal("id", args["id"]);
    return await builder.ExecuteSingle();
  }
}