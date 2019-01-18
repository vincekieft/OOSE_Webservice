import 'package:OOSE/Router/Router.dart';
import 'package:OOSE/Router/src/Types/IOptionsRequest.dart';
import '../Models/User.dart';

class TestRoute implements IController, IGetRequest, IOptionsRequest{

  @override
  String path() {
    return "user/:id";
  }

  @override
  Future<Object> GET(Map<String,dynamic> args) async{
    User d = new User();
    d.id = 10;
    d.name = "Hassan";
    return new User();
  }

  @override
  Future<Object> OPTIONS(Map<String, dynamic> args) async{
    User d = new User();
    d.id = 10;
    d.name = "Hassan";
    return new User();
  }
}