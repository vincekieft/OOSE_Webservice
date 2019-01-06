import 'dart:mirrors';

import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/Annotations/Column.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/FieldAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/QueryRow.dart';

class ParchedObject{

  QueryRow _row;
  RuntimeClassReflection _reflection;
  dynamic _object;
  InstanceMirror _mirror;

  ParchedObject(InstanceMirror mirror, RuntimeClassReflection reflection, QueryRow row){
    _mirror = mirror;
    _object = mirror.reflectee;
    _reflection = reflection;
    _row = row;
  }

  // Public methods
  void FillColumn(String identifier,dynamic value){
    FieldAnnotationDecorator<Column> field = _reflection.FindColumnByIdentifier(identifier);
    if (field != null) { _mirror.setField(new Symbol(field.Identifier), value); }
  }

  dynamic GetRowColumnValue(String column){
    return _row.values[column];
  }

  // Getters
  dynamic get Identifier {
    FieldAnnotationDecorator<Column> primary = _reflection.PrimaryKey;
    if(primary != null){ // If has a pimary key
      return _mirror.getField(new Symbol(primary.Identifier)).reflectee;
    }

    return null;
  }
  QueryRow get Row => _row;
  RuntimeClassReflection get Reflection => _reflection;
  dynamic get Object => _object;
  InstanceMirror get Mirror => _mirror;
}