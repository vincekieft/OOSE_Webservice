import '../../Repositories/LeerdoelRepository.dart';
import '../Modules/ModuleSpecificController.dart';

class LeerdoelenStatusController extends ModuleSpecificController{

  @override
  String path() {
    return "${super.path()}/goals_status";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{

    List used = await new LeerdoelRepository().GetAllUsedLeerdoelen(args["id"]);
    List unused = await new LeerdoelRepository().GetAllUnusedLeerdoelen(args["id"]);

    return {
      "used" : used,
      "unused" : unused
    };
  }
}