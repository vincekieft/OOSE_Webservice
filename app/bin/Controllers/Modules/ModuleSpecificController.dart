import 'package:OOSE/Router/Router.dart';
import '../../Singletons/Repositories.dart';

class ModuleSpecificController implements IController, IGetRequest{

  @override
  String path() {
    return "Module/:id";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Modulen.GetModuleById(args["id"]);
  }

}