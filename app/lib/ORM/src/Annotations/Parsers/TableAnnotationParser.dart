import 'dart:mirrors';

import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Parsers/AnnotationParser.dart';
import 'package:OOSE/ORM/src/Annotations/Table.dart';

class TableAnnotationParser extends AnnotationParser<AnnotationDecorator<Table>>{

  TableAnnotationParser(ORM orm) : super(orm);

  @override
  bool IsInstanceOf(instance) {
    return instance is Table;
  }

  @override
  List<InstanceMirror> GetMetaData(ClassMirror mirror) {
    return mirror.metadata;
  }

  @override
  AnnotationDecorator<Table> CreateInstanceOf(int index, ClassMirror mirror, reflectee, InstanceMirror instance, AnnotationDecorator<Table> table) {
    return new AnnotationDecorator<Table>(reflectee as Table, mirror.reflectedType);
  }
}