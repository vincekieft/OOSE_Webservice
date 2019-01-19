import '../../Repositories/LeerdoelRepository.dart';
import '../Lessen/LesSpecificController.dart';

class LeerdoelenController extends LesSpecificController{

  @override
  String path() {
    return "${super.path()}/Goals";
  }
  
  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    return await new LeerdoelRepository().GetAllLesLeerdoelen(args["id"]);
  }
}