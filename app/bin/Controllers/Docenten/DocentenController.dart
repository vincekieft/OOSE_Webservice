import 'package:OOSE/Router/Router.dart';
import '../../Singletons/Repositories.dart';

class DocentenController implements IController, IGetRequest{

  @override
  String path() {
    return "Teachers";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    return await Repositories.I().Docenten.GetAllDocenten();
  }

}