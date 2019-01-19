import 'package:OOSE/Router/Router.dart';
import '../../Repositories/DocentRepository.dart';

class DocentenController implements IController, IGetRequest{

  @override
  String path() {
    return "Teachers";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    return await new DocentRepository().GetAllDocenten();
  }

}