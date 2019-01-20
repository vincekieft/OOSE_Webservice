import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/ModuleStudent.dart';
import '../../RequestModels/CreateModuleStudentModel.dart';
import '../Modules/ModuleSpecificController.dart';

class ModuleStudentController extends ModuleSpecificController implements IPostRequest{
  @override
  String path() {
    return "${super.path()}/student";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{ return null; } // override parent route

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateModuleStudentModel create = JSON.Decode<CreateModuleStudentModel>(args["body"]);
    DB.orm.Persist<ModuleStudent>(create.ToModuleStudent(args["id"]));
    return null;
  }
}