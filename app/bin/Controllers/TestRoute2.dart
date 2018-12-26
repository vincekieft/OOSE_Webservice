import 'package:OOSE/Router/Router.dart';

class TestRoute2 implements IController, IGetRequest{

  @override
  String path() {
    return "user/:id/:kont/honden";
  }

  @override
  Object GET(Map<String,dynamic> args) {
    return "HONDENNN,,   User: ${args["id"]} and kont: ${args['kont']}";
  }
}