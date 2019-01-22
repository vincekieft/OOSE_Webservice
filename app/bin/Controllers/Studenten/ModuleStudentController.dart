import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../DataTransferObjects/CreateModuleStudentDTO.dart';
import '../../Singletons/Repositories.dart';
import '../Modules/ModuleSpecificController.dart';

class ModuleStudentController extends ModuleSpecificController implements IPostRequest{
  @override
  String path() {
    return "${super.path()}/student";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Studenten.GetAllModuleStudents(args["id"]);
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateModuleStudentDTO create = JSON.Decode<CreateModuleStudentDTO>(args["body"]);
    Repositories.I().Studenten.AddStudentToModule(create.ToModuleStudent(args["id"]));
    return null;
  }
}