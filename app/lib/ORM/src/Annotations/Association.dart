import 'package:OOSE/ORM/src/Annotations/Base/IdentifiableAnnotation.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/ParchedObject.dart';

abstract class Association extends IdentifiableAnnotation{
  const Association(String identifier) : super(identifier);

  // Abstract methods
  void ResolveAssociation(AssociationAnnotationDecorator<Association> association, ParchedObject object,  Map<String, Map<dynamic, ParchedObject>> searchMap);

  // Getters
  bool get IsVirtualAttribute => false;
}