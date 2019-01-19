import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/Opleiding.dart';
import '../../RequestModels/CreateOpleidingModel.dart';

class OpleidingSpecificController implements IController, IGetRequest{

  @override
  String path() {
    return "Education/:id";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    CreateOpleidingModel create = JSON.Decode<CreateOpleidingModel>(args["body"]);
    DB.orm.Persist<Opleiding>(create.ToOpleiding());
    return null;
  }

}