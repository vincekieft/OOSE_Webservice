import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/ModuleStudent.dart';
import '../../Repositories/StudentRepository.dart';
import '../../RequestModels/CreateModuleStudentModel.dart';
import '../Modules/ModuleSpecificController.dart';

class ModuleStudentController extends ModuleSpecificController implements IPostRequest{
  @override
  String path() {
    return "${super.path()}/student";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await new StudentRepository().GetAllModuleStudents(args["id"]);
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateModuleStudentModel create = JSON.Decode<CreateModuleStudentModel>(args["body"]);
    DB.orm.Persist<ModuleStudent>(create.ToModuleStudent(args["id"]));
    return null;
  }
}