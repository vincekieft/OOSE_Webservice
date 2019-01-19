import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/Student.dart';
import '../../RequestModels/CreateStudentModel.dart';

class StudentController implements IController, IPostRequest{

  @override
  String path() {
    return "Student";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateStudentModel create = JSON.Decode<CreateStudentModel>(args["body"]);
    DB.orm.Persist<Student>(create.ToStudent());
    return null;
  }

}