import '../../Repositories/LeerdoelRepository.dart';
import '../Lessen/LesSpecificController.dart';

class LesUnusedLeerdoelenController extends LesSpecificController{
  @override
  String path() {
    return "${super.path()}/unused_goals";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await new LeerdoelRepository().GetAllLesUnusedLeerdoelen(args["id"]);
  }
}