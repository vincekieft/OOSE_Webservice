import '../../Singletons/Repositories.dart';
import '../Modules/ModuleSpecificController.dart';

class LessenController extends ModuleSpecificController{

  @override
  String path() {
    return "${super.path()}/Classes";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    return await Repositories.I().Lessen.GetAllModuleLessen(args["id"]);
  }
}