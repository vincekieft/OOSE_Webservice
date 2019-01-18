import 'dart:io';

abstract class IRouter{
  void Route(HttpRequest request);
  void OnRequest(HttpRequest request);
}