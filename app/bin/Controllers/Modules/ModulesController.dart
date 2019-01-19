import 'package:OOSE/Router/Router.dart';

import '../../Repositories/ModulesRepository.dart';

class ModulesController implements IController, IGetRequest{

  @override
  String path() {
    return "Modules";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await new ModulesRepository().GetAllModules();
  }

}