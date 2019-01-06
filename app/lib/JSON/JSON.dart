import 'dart:mirrors';

import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';

class JSON{
  // Static methods
  static String Encode(dynamic object){
    ClassMirror classMirror = reflectClass(object.runtimeType);
    InstanceMirror mirror = reflect(object);
    List<String> variables = new List();

    classMirror.declarations.values.forEach((DeclarationMirror declaration){
      if(declaration is VariableMirror){
        VariableMirror variableMirror = declaration;
        variables.add(VariableToJson(mirror, variableMirror));
      }
    });

    return "{ ${ ArrayUtils.JoinList(variables, ",")} }";
  }

  // Private methods
  static String VariableToJson(InstanceMirror instance, VariableMirror variable){
    return "${MirrorSystem.getName(variable.simpleName)}: ${instance.getField(variable.simpleName).reflectee}";
  }
}