import 'dart:io';
import '../Controllers/Docenten/DocentController.dart';
import '../Controllers/Docenten/DocentenController.dart';
import '../Controllers/OpleidingController.dart';
import '../Controllers/Studenten/StudentController.dart';
import '../Controllers/Studenten/StudentenController.dart';
import 'IRouter.dart';
import 'package:OOSE/Router/Router.dart';

class OOSERouter extends Router implements IRouter{
  OOSERouter() : super([
    new OpleidingController(),
    new StudentenController(),
    new StudentController(),
    new DocentenController(),
    new DocentController()
  ]);

  @override
  void OnRequest(HttpRequest request) async{
    await Route(request);
  }
}