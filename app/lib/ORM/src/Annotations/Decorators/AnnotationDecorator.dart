import 'package:OOSE/ORM/src/Annotations/Base/IdentifiableAnnotation.dart';

class AnnotationDecorator<T extends IdentifiableAnnotation> implements IdentifiableAnnotation{

  // Private variables
  T _identifiable;
  Type _attachedType;

  AnnotationDecorator(T identifiable, Type attachedType){
    _identifiable = identifiable;
    _attachedType = attachedType;
  }

  @override
  String get Identifier => _identifiable.Identifier;
  Type get AttachedType => _attachedType;
  T get Identifiable => _identifiable;
}