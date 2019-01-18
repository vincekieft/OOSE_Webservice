import 'dart:mirrors';

import 'package:OOSE/JSON/src/Annotations/JSONAnnotation.dart';
import 'package:OOSE/JSON/src/JSONDecoder.dart';
import 'package:OOSE/JSON/src/JSONEncoder.dart';

class JSONDate extends JSONAnnotation{

  const JSONDate();

  @override
  Map<String, dynamic> ToHash(dynamic value, VariableMirror mirror, JSONEncoder encoder) {
    return {MirrorSystem.getName(mirror.simpleName) : value.toString() };
  }

  @override
  ToValue(value, VariableMirror mirror, JSONDecoder decoder) {
    return DateTime.parse(value);
  }

}