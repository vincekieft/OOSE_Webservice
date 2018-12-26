import 'package:OOSE/Router/Router.dart';

class TestRoute implements IController, IGetRequest{

  @override
  String path() {
    return "user/:id/:kont";
  }

  @override
  Object GET(Map<String,dynamic> args) {
    return "User: ${args["id"]} and kont: ${args['kont']}   ${args['anderding']}";
  }
}