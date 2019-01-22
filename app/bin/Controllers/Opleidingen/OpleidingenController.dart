import 'package:OOSE/Router/Router.dart';
import '../../Singletons/Repositories.dart';

class OpleidingenController implements IController, IGetRequest{

  @override
  String path() {
    return "Educations";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    return await Repositories.I().Opleidingen.GetAllOpleidingen();
  }

}