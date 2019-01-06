import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Table.dart';

abstract class AnnotationParser<T extends AnnotationDecorator>{

  // Private variables
  ORM _orm;

  // Abstract methods
  List<InstanceMirror> GetMetaData(ClassMirror mirror);
  bool IsInstanceOf(dynamic instance);
  T CreateInstanceOf(int index, ClassMirror mirror, dynamic reflectee, InstanceMirror instance, AnnotationDecorator<Table> table);

  // Constructor
  AnnotationParser(ORM orm){
    _orm = orm;
  }

  // Getters
  ORM get Orm => _orm;

  // Public methods
  T FindAnnotation(Type type, [AnnotationDecorator<Table> table]){
    List<T> annotations = FindAnnotations(type, table);
    return (annotations.length > 0) ? annotations.first : null;
  }
  List<T> FindAnnotations(Type type, [AnnotationDecorator<Table> table]){
    ClassMirror mirror = reflectClass(type);
    List<T> annotations = new List<T>();
    List<InstanceMirror> metadata = GetMetaData(mirror);

    int index = 0;

    for(InstanceMirror instance in metadata) {
      if (IsInstanceOf(instance.reflectee)) {
        annotations.add(CreateInstanceOf(index, mirror, instance.reflectee, instance, table));
      }

      index++; // up index based on given list
    }

    return annotations;
  }
}