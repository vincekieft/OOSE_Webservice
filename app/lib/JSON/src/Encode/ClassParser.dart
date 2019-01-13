import 'dart:mirrors';

import 'package:OOSE/JSON/src/JSONEncoder.dart';
import 'package:OOSE/JSON/src/Encode/IParser.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';

class ClassParser implements IParser {

  @override
  String Encode(value) {
    ClassMirror classMirror = reflectClass(value.runtimeType);
    InstanceMirror mirror = reflect(value);
    List<String> variables = new List();
    JSONEncoder encoder = new JSONEncoder();

    classMirror.declarations.values.forEach((DeclarationMirror declaration){
      if(declaration is VariableMirror){
        variables.add(_VariableToJson(mirror,declaration,encoder));
      }
    });

    return "{ ${ ArrayUtils.JoinList(variables, ",")} }";
  }

  @override
  Type ParseType() {
    return Object;
  }

  // Private methods
  String _VariableToJson(InstanceMirror instance, VariableMirror variable, JSONEncoder encoder){
    return _EncodeVariable(
        MirrorSystem.getName(variable.simpleName),
        encoder.Encode(instance.getField(variable.simpleName).reflectee)
    );
  }

  String _EncodeVariable(String name, String value){
    return "\"${name}\":${value}";
  }

  @override
  int Priority() {
    return 0;
  }

  @override
  bool IsOfType(object) {
    return true;
  }
}