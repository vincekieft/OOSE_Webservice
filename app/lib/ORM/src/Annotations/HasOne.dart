import 'dart:mirrors';

import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/ParchedObject.dart';

class HasOne extends Association{
  const HasOne(String identifier, [bool composition = false]) : super(identifier, composition);

  @override
  void ResolveAssociation(AssociationAnnotationDecorator<Association> association, ParchedObject object,  Map<String, Map<dynamic, ParchedObject>> searchMap) {
    String columnIdentifier = "${association.AnnotationTable.Identifier}#${association.Identifier}";

    Map<dynamic, ParchedObject> SearchRow = searchMap[association.ReferenceTable.Identifier];

    if(SearchRow != null){
      ParchedObject referenceObject = SearchRow[object.GetRowColumnValue(columnIdentifier)];

      if(referenceObject != null){ // Set reference is there is a reference object
        object.Mirror.setField(new Symbol(association.VariableName), referenceObject.Object);
      }
    }
  }

  @override
  void ForeachValue(AssociationAnnotationDecorator<Association> decorator, InstanceMirror mirror, Function callback) {
    dynamic value = mirror.getField(decorator.VariableSymbol).reflectee;
    if(value != null) { callback(value); }
  }
}