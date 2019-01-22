import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../DataTransferObjects/CreateLeerdoelDTO.dart';
import '../../Singletons/Repositories.dart';

class LeerdoelController implements IController, IPostRequest{

  @override
  String path() {
    return "goal";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateLeerdoelDTO create = JSON.Decode<CreateLeerdoelDTO>(args["body"]);
    Repositories.I().Leerdoelen.PersistLeerdoel(create.ToLeerdoel());
    return null;
  }

}