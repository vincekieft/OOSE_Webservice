import 'dart:io';
import '../Controllers/OpleidingController.dart';
import '../Controllers/StudentenController.dart';
import 'IRouter.dart';
import 'package:OOSE/Router/Router.dart';

class OOSERouter extends Router implements IRouter{
  OOSERouter() : super([
    new OpleidingController(),
    new StudentenController()
  ]);

  @override
  void OnRequest(HttpRequest request) async{
    await Route(request);
  }
}