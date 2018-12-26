import 'package:shelf/shelf.dart';
import 'IRouter.dart';
import 'package:OOSE/Router/Router.dart';
import '../Controllers/TestRoute.dart';
import '../Controllers/TestRoute2.dart';

class OOSERouter extends Router implements IRouter{
  OOSERouter() : super([
    new TestRoute(),
    new TestRoute2()
  ]);

  @override
  Response OnRequest(Request request) {
    return Route(request.url.toString(),request.method);
  }
}