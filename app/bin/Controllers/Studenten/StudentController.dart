import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../DataTransferObjects/CreateStudentDTO.dart';
import '../../Singletons/Repositories.dart';

class StudentController implements IController, IPostRequest{

  @override
  String path() {
    return "Student";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateStudentDTO create = JSON.Decode<CreateStudentDTO>(args["body"]);
    Repositories.I().Studenten.PersistStudent(create.ToStudent());
    return null;
  }

}