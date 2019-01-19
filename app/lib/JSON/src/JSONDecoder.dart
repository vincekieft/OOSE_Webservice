import 'dart:convert';

import 'dart:mirrors';

import 'package:OOSE/JSON/src/Annotations/JSONAnnotation.dart';

class JSONDecoder{
  // Public methods
  T Decode<T>(String json){
    Map<String, dynamic> hash = jsonDecode(json);
    return ResolveObject(hash, T);
  }

  dynamic ResolveObject(Map<String, dynamic> hash, Type type){
    ClassMirror mirror = reflectClass(type);
    dynamic instance = _CreateInstanceOf(mirror);
    InstanceMirror instanceMirror = reflect(instance);

    mirror.declarations.values.forEach((DeclarationMirror declaration){
      if(declaration is VariableMirror){
        _SetField(instanceMirror, hash, declaration);
      }
    });

    return instance;
  }

  // Private variables
  void _SetField(InstanceMirror instance, Map<String, dynamic> valueHash, VariableMirror mirror){
    String variableName = MirrorSystem.getName(mirror.simpleName);
    JSONAnnotation annotation = _FindAnnotation(mirror);
    dynamic value = _ProcessValue(valueHash[variableName]);

    if(annotation != null && value != null){
      value = annotation.ToValue(value, mirror, this);
    }

    instance.setField(new Symbol(variableName), value);
  }

  dynamic _ProcessValue(dynamic value){
    if(_IsInt(value)){ return int.parse(value); }
    if(_IsDouble(value)){ return double.parse(value); }

    return value;
  }

  bool _IsInt(dynamic value) {
    if(value == null) { return false; }
    return int.tryParse(value) != null;
  }

  bool _IsDouble(dynamic value) {
    if(value == null) { return false;}
    return double.tryParse(value) != null;
  }


  dynamic _CreateInstanceOf<T>(ClassMirror mirror){
    return mirror.newInstance(new Symbol(''), []).reflectee;
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