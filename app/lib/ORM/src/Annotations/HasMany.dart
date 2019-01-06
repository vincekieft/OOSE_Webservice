import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/ParchedObject.dart';

class HasMany extends Association {
  const HasMany(String identifier) : super(identifier);

  @override
  void ResolveAssociation(AssociationAnnotationDecorator<Association> association, ParchedObject object,  Map<String, Map<dynamic, ParchedObject>> searchMap) {
    String columnIdentifier = "${association.ReferenceTable.Identifier}#${association.Identifier}";
    Symbol variableSymbol = new Symbol(association.VariableName);

    // Ensure list
    List targetList = object.Mirror.getField(variableSymbol).reflectee;
    if(targetList == null){ // Ensure list exists
      targetList = new List(); // Create new list
      object.Mirror.setField(variableSymbol,targetList); // Link list to variable
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
}