import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/LesDocent.dart';
import '../../Repositories/DocentRepository.dart';
import '../../RequestModels/CreateLesDocentModel.dart';
import '../Lessen/LesSpecificController.dart';

class LesDocentController extends LesSpecificController implements IPostRequest{
  @override
  String path() {
    return "${super.path()}/teacher";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await new DocentRepository().GetAllLesDocenten(args["id"]);
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateLesDocentModel create = JSON.Decode<CreateLesDocentModel>(args["body"]);
    DB.orm.Persist<LesDocent>(create.ToLesDocent(args["id"]));
    return null;
  }
}