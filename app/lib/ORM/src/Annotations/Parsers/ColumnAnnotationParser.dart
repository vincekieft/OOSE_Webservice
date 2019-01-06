import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Column.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/FieldAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Parsers/VariableAnnotationParser.dart';
import 'package:OOSE/ORM/src/Annotations/Table.dart';

class ColumnAnnotationParser extends VariableAnnotationParser<FieldAnnotationDecorator<Column>, Column> {

  ColumnAnnotationParser(ORM orm) : super(orm);

  @override
  FieldAnnotationDecorator<Column> CreateInstanceOf(int index, ClassMirror mirror, reflectee, InstanceMirror instance, AnnotationDecorator<Table> table) {
    VariableMirror varMirror = FindDeclarationMirror(index, mirror) as VariableMirror;
    return new FieldAnnotationDecorator(reflectee as Column, varMirror, table, varMirror.type.reflectedType);
  }
}