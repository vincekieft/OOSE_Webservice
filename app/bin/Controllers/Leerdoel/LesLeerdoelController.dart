import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/LesLeerdoel.dart';
import '../../Repositories/LeerdoelRepository.dart';
import '../../RequestModels/CreateLesLeerdoelModel.dart';
import '../Lessen/LesSpecificController.dart';

class LesLeerdoelController extends LesSpecificController implements IPostRequest{
  @override
  String path() {
    return "${super.path()}/goal";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await new LeerdoelRepository().GetAllLesLeerdoelen(args["id"]);
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateLesLeerdoelModel create = JSON.Decode<CreateLesLeerdoelModel>(args["body"]);
    DB.orm.Persist<LesLeerdoel>(create.ToLesLeerdoel(args["id"]));
    return null;
  }
}