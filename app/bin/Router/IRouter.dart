import 'dart:io';

import 'package:shelf/shelf.dart';

abstract class IRouter{
  void Route(HttpRequest request);
  void OnRequest(HttpRequest request);
}