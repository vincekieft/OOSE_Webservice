import 'dart:mirrors';

import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/ParchedObject.dart';

class HasMany extends Association {
  const HasMany(String identifier, [bool composition = false]) : super(identifier, composition);

  @override
  void ResolveAssociation(AssociationAnnotationDecorator<Association> association, ParchedObject object,  Map<String, Map<dynamic, ParchedObject>> searchMap) {
    String columnIdentifier = "${association.ReferenceTable.Identifier}#${association.Identifier}";

    // Ensure list
    List targetList = object.Mirror.getField(association.VariableSymbol).reflectee;
    if(targetList == null){ // Ensure list exists
      targetList = new List(); // Create new list
      object.Mirror.setField(association.VariableSymbol,targetList); // Link list to variable
    }

    // Find matches in reference table
    Map<dynamic, ParchedObject> targetMap = searchMap[association.ReferenceTable.Identifier];

    if(targetMap != null) {
      targetMap.values.forEach((ParchedObject parched) {
        if (parched.GetRowColumnValue(columnIdentifier) ==
            object.Identifier) { // Found match
          targetList.add(parched.Object);
        }
      });
    }
  }

  @override
  bool get IsVirtualAttribute => true;

  @override
  void ForeachValue(AssociationAnnotationDecorator<Association> decorator, InstanceMirror mirror, Function callback) {
    List valueList = mirror.getField(decorator.VariableSymbol).reflectee;

    if(valueList != null){
      valueList.forEach((value){
        if(value != null){
          callback(value);
        }
      });
    }
  }
}