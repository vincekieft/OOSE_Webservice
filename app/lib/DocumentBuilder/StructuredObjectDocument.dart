import 'package:OOSE/DocumentBuilder/StructuredObject.dart';

class StructuredObjectDocument {

  List<StructuredObject> _parentStructures = new List<StructuredObject>();

  StructuredObjectDocument([List<StructuredObject> parents]){
    if(parents!=null){
      _parentStructures = parents;
    }
  }

  List<StructuredObject> get parents =>_parentStructures;

}