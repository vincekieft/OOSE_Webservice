import '../../Singletons/Repositories.dart';
import '../Modules/ModuleSpecificController.dart';

class ModuleUnusedStudentsController extends ModuleSpecificController{
  @override
  String path() {
    return "${super.path()}/unused_students";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Studenten.GetAllUnusedModuleStudents(args["id"]);
  }
}