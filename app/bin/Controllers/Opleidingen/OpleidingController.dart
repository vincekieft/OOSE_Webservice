import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/Opleiding.dart';
import '../../RequestModels/CreateOpleidingModel.dart';

class OpleidingController implements IController, IPostRequest{

  @override
  String path() {
    return "Education";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateOpleidingModel create = JSON.Decode<CreateOpleidingModel>(args["body"]);
    DB.orm.Persist<Opleiding>(create.ToOpleiding());
    return null;
  }

}