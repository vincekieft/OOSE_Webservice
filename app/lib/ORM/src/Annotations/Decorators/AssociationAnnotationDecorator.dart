import 'dart:mirrors';
import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Base/IdentifiableAnnotation.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/FieldAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Table.dart';

class AssociationAnnotationDecorator<T extends Association> extends FieldAnnotationDecorator<T>{

  // Private variables
  AnnotationDecorator<Table> _referenceTable;

  AssociationAnnotationDecorator(IdentifiableAnnotation identifiable, VariableMirror mirror, AnnotationDecorator<Table> table, AnnotationDecorator<Table> referenceTable, Type attachedType) : super(identifiable, mirror, table, attachedType){
    _referenceTable = referenceTable;
  }

  // Getters
  AnnotationDecorator<Table> get ReferenceTable => _referenceTable;
}