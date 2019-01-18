import 'dart:io';
import '../Controllers/OpleidingController.dart';
import 'IRouter.dart';
import 'package:OOSE/Router/Router.dart';

class OOSERouter extends Router implements IRouter{
  OOSERouter() : super([
    new OpleidingController()
  ]);

  @override
  void OnRequest(HttpRequest request){
    Route(request);
  }
}