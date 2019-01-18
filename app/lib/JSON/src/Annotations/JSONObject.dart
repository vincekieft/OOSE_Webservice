import 'dart:mirrors';

import 'package:OOSE/JSON/src/Annotations/JSONAnnotation.dart';
import 'package:OOSE/JSON/src/JSONDecoder.dart';
import 'package:OOSE/JSON/src/JSONEncoder.dart';

class JSONObject extends JSONAnnotation{

  const JSONObject();

  @override
  Map<String, dynamic> ToHash(dynamic value, VariableMirror mirror, JSONEncoder encoder) {
    return {MirrorSystem.getName(mirror.simpleName) : encoder.GenerateHashForObject(value) };
  }

  @override
  ToValue(value, VariableMirror mirror, JSONDecoder decoder) {
    return decoder.ResolveObject(value, mirror.type.reflectedType);
  }

}