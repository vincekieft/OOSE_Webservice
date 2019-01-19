import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/Docent.dart';
import '../../RequestModels/CreateDocentModel.dart';

class DocentController implements IController, IPostRequest{

  @override
  String path() {
    return "Teacher";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateDocentModel create = JSON.Decode<CreateDocentModel>(args["body"]);
    DB.orm.Persist<Docent>(create.ToDocent());
    return null;
  }

}