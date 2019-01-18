import 'dart:convert';

import 'dart:mirrors';

import 'package:OOSE/JSON/src/Annotations/JSONAnnotation.dart';
import 'package:sqljocky5/sqljocky.dart';

class JSONEncoder{

  // Public methods
  String Encode(dynamic object){
    return jsonEncode(GenerateHashForObject(object));
  }

  Map<String, dynamic> GenerateHashForObject(dynamic object){
    // Initialize variables
    Map<String, dynamic> hash = new Map();
    ClassMirror mirror = reflectClass(object.runtimeType);
    InstanceMirror instanceMirror = reflect(object);

    // Loop through declarations
    for (DeclarationMirror declaration in mirror.declarations.values) {
      if(declaration is VariableMirror){
        hash.addAll(_VariableToHash(declaration, instanceMirror));
      }
    }

    return hash;
  }

  // Private methods
  Map<String, dynamic> _VariableToHash(VariableMirror mirror, InstanceMirror instanceMirror){
    Map<String, dynamic> variableHash = new Map();

    JSONAnnotation annotation = _FindAnnotation(mirror);

    var value = instanceMirror.getField(mirror.simpleName).reflectee;
    if(annotation == null){ // Primitive types
      if(value is Blob){ value = value.toString(); }
      variableHash[MirrorSystem.getName(mirror.simpleName)] = value;
    } else { // Annotations
      Map<String, dynamic> hash = annotation.ToHash(value, mirror, this);
      if(hash != null){
        variableHash.addAll(hash);
      }
    }

    return variableHash;
  }

  JSONAnnotation _FindAnnotation(VariableMirror mirror){
    for (InstanceMirror meta in mirror.metadata) {
      if(meta.reflectee is JSONAnnotation){
        return meta.reflectee;
      }
    }

    return null;
  }
}