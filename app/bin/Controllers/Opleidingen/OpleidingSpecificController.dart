import 'package:OOSE/Router/Router.dart';
import '../../Singletons/Repositories.dart';

class OpleidingSpecificController implements IController, IGetRequest{

  @override
  String path() {
    return "Education/:id";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    return await Repositories.I().Opleidingen.GetOpleidingById(args["id"]);
  }

}