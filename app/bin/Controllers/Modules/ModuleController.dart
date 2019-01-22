import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../DataTransferObjects/CreateModuleDTO.dart';
import '../../Singletons/Repositories.dart';

class ModuleController implements IController, IPostRequest{

  @override
  String path() {
    return "Module";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateModuleDTO create = JSON.Decode<CreateModuleDTO>(args["body"]);
    Repositories.I().Modulen.PersistModule(create.ToModule());
    return null;
  }

}