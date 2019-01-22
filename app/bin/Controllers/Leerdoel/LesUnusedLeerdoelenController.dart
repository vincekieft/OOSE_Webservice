import '../../Singletons/Repositories.dart';
import '../Lessen/LesSpecificController.dart';

class LesUnusedLeerdoelenController extends LesSpecificController{
  @override
  String path() {
    return "${super.path()}/unused_goals";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Leerdoelen.GetAllLesUnusedLeerdoelen(args["id"]);
  }
}