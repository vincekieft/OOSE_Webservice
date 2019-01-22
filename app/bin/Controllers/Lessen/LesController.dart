import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../DataTransferObjects/CreateLesDTO.dart';
import '../../Singletons/Repositories.dart';

class LesController implements IController, IPostRequest{

  @override
  String path() {
    return "Class";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateLesDTO create = JSON.Decode<CreateLesDTO>(args["body"]);
    Repositories.I().Lessen.PersistLes(create.ToLes());
    return null;
  }

}