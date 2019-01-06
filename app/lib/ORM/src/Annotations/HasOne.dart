import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/ParchedObject.dart';

class HasOne extends Association{
  const HasOne(String identifier) : super(identifier);

  @override
  void ResolveAssociation(AssociationAnnotationDecorator<Association> association, ParchedObject object,  Map<String, Map<dynamic, ParchedObject>> searchMap) {
    String columnIdentifier = "${association.AnnotationTable.Identifier}#${association.Identifier}";
    ParchedObject referenceObject = searchMap[association.ReferenceTable.Identifier][object.GetRowColumnValue(columnIdentifier)];

    if(referenceObject != null){ // Set reference is there is a reference object
      object.Mirror.setField(new Symbol(association.VariableName), referenceObject.Object);
    }
  }
}