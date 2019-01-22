import '../../Singletons/Repositories.dart';
import '../Modules/ModuleSpecificController.dart';

class ModuleLeerdoelenController extends ModuleSpecificController{
  @override
  String path() {
    return "${super.path()}/goals";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Leerdoelen.GetAllModuleLeerdoelen(args["id"]);
  }
}