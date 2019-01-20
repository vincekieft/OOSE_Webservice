import '../../Repositories/LesRepository.dart';
import '../Modules/ModuleSpecificController.dart';

class LessenController extends ModuleSpecificController{

  @override
  String path() {
    return "${super.path()}/Classes";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    return await new LesRepository().GetAllModuleLessen(args["id"]);
  }
}