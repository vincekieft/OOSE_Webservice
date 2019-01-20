import 'package:OOSE/Router/Router.dart';

import '../../Repositories/ModulesRepository.dart';

class EducationModulesController implements IController, IGetRequest{

  @override
  String path() {
    return "Modules/:id";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await new ModulesRepository().GetAllEducationModules(args["id"]);
  }

}