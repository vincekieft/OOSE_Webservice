import 'dart:mirrors';

import 'package:OOSE/ORM/src/Annotations/Base/IdentifiableAnnotation.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/ParchedObject.dart';

abstract class Association extends IdentifiableAnnotation{
  final bool _composition;

  const Association(String identifier, [this._composition = false]) : super(identifier);

  // Abstract methods
  void ResolveAssociation(AssociationAnnotationDecorator<Association> association, ParchedObject object,  Map<String, Map<dynamic, ParchedObject>> searchMap);
  void ForeachValue(AssociationAnnotationDecorator<Association> decorator, InstanceMirror mirror, Function callback);

  // Getters
  bool get IsVirtualAttribute => false;
  bool get IsComposition => _composition;
  bool get IsAggregation => !_composition;
}