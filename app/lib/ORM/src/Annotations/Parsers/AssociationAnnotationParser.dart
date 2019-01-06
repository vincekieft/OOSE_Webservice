import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Parsers/VariableAnnotationParser.dart';
import 'package:OOSE/ORM/src/Annotations/Table.dart';

class AssociationAnnotationParser extends VariableAnnotationParser<AssociationAnnotationDecorator<Association>, Association> {

  AssociationAnnotationParser(ORM orm) : super(orm);

  @override
  AssociationAnnotationDecorator<Association> CreateInstanceOf(int index, ClassMirror mirror, reflectee, InstanceMirror instance, AnnotationDecorator<Table> table) {
    VariableMirror varMirror = FindDeclarationMirror(index, mirror) as VariableMirror;
    RuntimeClassReflection referenceReflection = EnsureReflection(varMirror);
    return new AssociationAnnotationDecorator(reflectee as Association, varMirror, table, referenceReflection.TableAnnotation, varMirror.type.reflectedType);
  }

  RuntimeClassReflection EnsureReflection(VariableMirror mirror){
    Type type = mirror.type.reflectedType;
    if(mirror.type.typeArguments.length > 0){ // Check if variable is list etc
      type = mirror.type.typeArguments.first.reflectedType;
    }
    Orm.EnsureRuntimeReflection(type); // Ensure new found type
    return Orm.GetRuntimeReflection(type);
  }

}