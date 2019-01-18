import 'dart:io';
import '../Controllers/OpleidingController.dart';
import '../Controllers/Students/StudentController.dart';
import '../Controllers/Students/StudentenController.dart';
import 'IRouter.dart';
import 'package:OOSE/Router/Router.dart';

class OOSERouter extends Router implements IRouter{
  OOSERouter() : super([
    new OpleidingController(),
    new StudentenController(),
    new StudentController()
  ]);

  @override
  void OnRequest(HttpRequest request) async{
    await Route(request);
  }
}