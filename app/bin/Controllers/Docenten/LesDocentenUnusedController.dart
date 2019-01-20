import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/LesDocent.dart';
import '../../Repositories/DocentRepository.dart';
import '../../RequestModels/CreateLesDocentModel.dart';
import '../Lessen/LesSpecificController.dart';

class LesDocentenUnusedController extends LesSpecificController{
  @override
  String path() {
    return "${super.path()}/unused_teachers";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await new DocentRepository().GetAllUnusedLesDocenten(args["id"]);
  }
}