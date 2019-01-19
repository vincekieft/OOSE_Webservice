import '../../Repositories/LeerdoelRepository.dart';
import '../Modules/ModuleSpecificController.dart';

class ModuleLeerdoelenController extends ModuleSpecificController{
  @override
  String path() {
    return "${super.path()}/goals";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await new LeerdoelRepository().GetAllModuleLeerdoelen(args["id"]);
  }
}