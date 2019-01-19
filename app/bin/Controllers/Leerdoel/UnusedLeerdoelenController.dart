import '../../Repositories/LeerdoelRepository.dart';
import '../Modules/ModuleSpecificController.dart';

class UnusedLeerdoelenController extends ModuleSpecificController{
  @override
  String path() {
    return "${super.path()}/unused_goals";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await new LeerdoelRepository().GetAllUnusedLeerdoelen(args["id"]);
  }
}