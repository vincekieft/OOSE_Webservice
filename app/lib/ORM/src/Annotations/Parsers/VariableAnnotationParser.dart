import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Parsers/AnnotationParser.dart';

abstract class VariableAnnotationParser<T extends AnnotationDecorator, I> extends AnnotationParser<T> {

  VariableAnnotationParser(ORM orm) : super(orm);

  // Overrides
  @override
  List<InstanceMirror> GetMetaData(ClassMirror mirror) {
    List<InstanceMirror> metaData = new List<InstanceMirror>();

    for (DeclarationMirror declaration in mirror.declarations.values) {
      metaData.addAll(declaration.metadata);
    }

    return metaData;
  }

  @override
  bool IsInstanceOf(instance) {
    return instance is I;
  }

  // Private methods
  DeclarationMirror FindDeclarationMirror(int index, ClassMirror mirror){
    int count = 0;

    for (DeclarationMirror declaration in mirror.declarations.values) {
      for (var meta in declaration.metadata) {
        if(count == index){return declaration;}
        count++;
      }
    }

    throw("ColumnAnnotationParser could not find a matching declaration");
  }
}