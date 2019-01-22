import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../DataTransferObjects/CreateOpleidingDTO.dart';
import '../../Singletons/Repositories.dart';

class OpleidingController implements IController, IPostRequest{

  @override
  String path() {
    return "Education";
  }

  @override
  Future<Object> POST(Map<String, dynamic> args) {
    CreateOpleidingSTO create = JSON.Decode<CreateOpleidingSTO>(args["body"]);
    Repositories.I().Opleidingen.PersistOpleiding(create.ToOpleiding());
    return null;
  }

}