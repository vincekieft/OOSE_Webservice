import 'package:shelf/shelf.dart';

abstract class IRouter{
  void Route(String path, String method);
  Future<Response> OnRequest(Request request);
}