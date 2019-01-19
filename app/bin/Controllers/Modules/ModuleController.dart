import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';

import '../../Database/DB.dart';
import '../../Models/Module.dart';
import '../../RequestModels/CreateModuleModel.dart';

class ModuleController implements IController, IPostRequest{

  @override
  String path() {
    return "Module";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateModuleModel create = JSON.Decode<CreateModuleModel>(args["body"]);
    DB.orm.Persist<Module>(create.ToModule());
    return null;
  }

}