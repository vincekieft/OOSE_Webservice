import 'package:OOSE/Router/Router.dart';
import '../../Repositories/OpleidingRepository.dart';

class OpleidingenController implements IController, IGetRequest{

  @override
  String path() {
    return "Educations";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    return await new OpleidingRepository().GetAllOpleidingen();
  }

}