import 'dart:mirrors';
import 'package:OOSE/ORM/src/Annotations/Base/IdentifiableAnnotation.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Primary.dart';
import 'package:OOSE/ORM/src/Annotations/Table.dart';

class FieldAnnotationDecorator<T extends IdentifiableAnnotation> extends AnnotationDecorator<T> {

  // Private variables
  VariableMirror _mirror;
  AnnotationDecorator<Table> _table;

  FieldAnnotationDecorator(IdentifiableAnnotation identifiable, VariableMirror mirror, AnnotationDecorator<Table> table, Type attachedType) : super(identifiable, attachedType){
    _mirror = mirror;
    _table = table;
  }

  // Getters
  Type get VariableType => _mirror.type.reflectedType;
  VariableMirror get Variable => _mirror;
  String get VariableName => MirrorSystem.getName(_mirror.simpleName);
  bool get IsPrimary => Identifiable is Primary;
  AnnotationDecorator<Table> get AnnotationTable => _table;
}