import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/Leerdoel.dart';
import '../../RequestModels/CreateLeerdoelModel.dart';

class LeerdoelController implements IController, IPostRequest{

  @override
  String path() {
    return "goal";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateLeerdoelModel create = JSON.Decode<CreateLeerdoelModel>(args["body"]);
    DB.orm.Persist<Leerdoel>(create.ToLeerdoel());
    return null;
  }

}