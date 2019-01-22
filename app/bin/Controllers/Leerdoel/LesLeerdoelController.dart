import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../DataTransferObjects/CreateLesLeerdoelDTO.dart';
import '../../Singletons/Repositories.dart';
import '../Lessen/LesSpecificController.dart';

class LesLeerdoelController extends LesSpecificController implements IPostRequest{
  @override
  String path() {
    return "${super.path()}/goal";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Leerdoelen.GetAllLesLeerdoelen(args["id"]);
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateLesLeerdoelDTO create = JSON.Decode<CreateLesLeerdoelDTO>(args["body"]);
    Repositories.I().Leerdoelen.AddLeerdoelToLes(create.ToLesLeerdoel(args["id"]));
    return null;
  }
}