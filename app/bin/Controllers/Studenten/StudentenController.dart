import 'package:OOSE/Router/Router.dart';
import '../../Singletons/Repositories.dart';

class StudentenController implements IController, IGetRequest{

  @override
  String path() {
    return "Students";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    return await Repositories.I().Studenten.GetAllStudents();
  }

}