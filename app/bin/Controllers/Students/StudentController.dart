import 'package:OOSE/Router/Router.dart';
import '../../Repositories/StudentRepository.dart';

class StudentController implements IController, IPostRequest{

  @override
  String path() {
    return "Student";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    // TODO: implement POST
    return null;
  }

}