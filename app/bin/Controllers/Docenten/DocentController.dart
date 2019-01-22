import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../DataTransferObjects/CreateDocentDTO.dart';
import '../../Singletons/Repositories.dart';

class DocentController implements IController, IPostRequest{

  @override
  String path() {
    return "Teacher";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateDocentDTO create = JSON.Decode<CreateDocentDTO>(args["body"]);
    Repositories.I().Docenten.PersistDocent(create.ToDocent());
    return null;
  }

}