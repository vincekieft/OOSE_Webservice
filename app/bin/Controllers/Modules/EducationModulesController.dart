import 'package:OOSE/Router/Router.dart';
import '../../Singletons/Repositories.dart';

class EducationModulesController implements IController, IGetRequest{

  @override
  String path() {
    return "Modules/:id";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Modulen.GetAllEducationModules(args["id"]);
  }

}