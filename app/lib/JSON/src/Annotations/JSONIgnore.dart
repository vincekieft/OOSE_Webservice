import 'dart:mirrors';
import 'package:OOSE/JSON/src/Annotations/JSONAnnotation.dart';
import 'package:OOSE/JSON/src/JSONDecoder.dart';
import 'package:OOSE/JSON/src/JSONEncoder.dart';

class JSONIgnore extends JSONAnnotation{

  const JSONIgnore();

  @override
  Map<String, dynamic> ToHash(dynamic value, VariableMirror mirror, JSONEncoder encoder) {
    return null;
  }

  @override
  ToValue(value, VariableMirror mirrir, JSONDecoder decorder) {
    return null;
  }

}