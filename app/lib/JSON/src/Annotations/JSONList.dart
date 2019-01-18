import 'dart:mirrors';

import 'package:OOSE/JSON/src/Annotations/JSONAnnotation.dart';
import 'package:OOSE/JSON/src/JSONDecoder.dart';
import 'package:OOSE/JSON/src/JSONEncoder.dart';

class JSONList extends JSONAnnotation{

  const JSONList();

  @override
  Map<String, dynamic> ToHash(dynamic value, VariableMirror mirror, JSONEncoder encoder) {
    List input = value as List;
    List<Map<String, dynamic>> result = new List();

    input.forEach((dynamic item){
      result.add(encoder.GenerateHashForObjectSingle(item));
    });

    return {MirrorSystem.getName(mirror.simpleName) : result};
  }

  @override
  ToValue(value, VariableMirror mirror, JSONDecoder decoder) {
    List result = new List();
    List input = value as List;

    input.forEach((input){
      decoder.ResolveObject(input, mirror.type.typeArguments.first.reflectedType);
    });

    return result;
  }

}