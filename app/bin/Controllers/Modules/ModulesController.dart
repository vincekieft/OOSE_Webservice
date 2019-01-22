import 'package:OOSE/Router/Router.dart';
import '../../Singletons/Repositories.dart';

class ModulesController implements IController, IGetRequest{

  @override
  String path() {
    return "Modules";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Modulen.GetAllModules();
  }

}