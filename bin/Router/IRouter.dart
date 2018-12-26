import 'package:shelf/shelf.dart';

abstract class IRouter{
  void Route(String path, String method);
  Response OnRequest(Request request);
}