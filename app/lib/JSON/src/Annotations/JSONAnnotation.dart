import 'dart:mirrors';

import 'package:OOSE/JSON/src/JSONDecoder.dart';
import 'package:OOSE/JSON/src/JSONEncoder.dart';

abstract class JSONAnnotation{
  const JSONAnnotation();

  // Abstract methods
  Map<String, dynamic> ToHash(dynamic value, VariableMirror mirror, JSONEncoder encoder);
  dynamic ToValue(dynamic value, VariableMirror mirror, JSONDecoder decoder);
}