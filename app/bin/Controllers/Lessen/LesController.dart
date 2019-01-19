import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';

import '../../Database/DB.dart';
import '../../Models/Les.dart';
import '../../RequestModels/CreateLesModel.dart';

class LesController implements IController, IPostRequest{

  @override
  String path() {
    return "Class";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateLesModel create = JSON.Decode<CreateLesModel>(args["body"]);
    DB.orm.Persist<Les>(create.ToLes());
    return null;
  }

}