import 'package:OOSE/Router/Router.dart';
import '../../Singletons/Repositories.dart';

class LesSpecificController implements IController, IGetRequest{

  @override
  String path() {
    return "Class/:id";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    return await Repositories.I().Lessen.GetLesById(args["id"]);
  }

}