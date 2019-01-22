import '../../Singletons/Repositories.dart';
import '../Lessen/LesSpecificController.dart';

class LesDocentenUnusedController extends LesSpecificController{
  @override
  String path() {
    return "${super.path()}/unused_teachers";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Docenten.GetAllUnusedLesDocenten(args["id"]);
  }
}