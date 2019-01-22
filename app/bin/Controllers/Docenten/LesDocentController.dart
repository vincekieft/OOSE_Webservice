import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../DataTransferObjects/CreateLesDocentDTO.dart';
import '../../Singletons/Repositories.dart';
import '../Lessen/LesSpecificController.dart';

class LesDocentController extends LesSpecificController implements IPostRequest{
  @override
  String path() {
    return "${super.path()}/teacher";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Docenten.GetAllLesDocenten(args["id"]);
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateLesDocentDTO create = JSON.Decode<CreateLesDocentDTO>(args["body"]);
    Repositories.I().Docenten.AddDocentToLes(create.ToLesDocent(args["id"]));
    return null;
  }
}