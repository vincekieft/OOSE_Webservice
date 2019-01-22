import '../../Singletons/Repositories.dart';
import '../Modules/ModuleSpecificController.dart';

class LeerdoelenStatusController extends ModuleSpecificController{

  @override
  String path() {
    return "${super.path()}/goals_status";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{

    List used = await Repositories.I().Leerdoelen.GetAllUsedLeerdoelen(args["id"]);
    List unused = await Repositories.I().Leerdoelen.GetAllUnusedLeerdoelen(args["id"]);

    return {
      "used" : used,
      "unused" : unused
    };
  }
}