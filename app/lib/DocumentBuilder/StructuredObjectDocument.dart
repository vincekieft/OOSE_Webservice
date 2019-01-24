import 'package:OOSE/DocumentBuilder/StructuredObject.dart';

class StructuredObjectDocument {

  List<StructuredObject> _parentStructures;

  StructuredObjectDocument([List<StructuredObject> parents]){
    _parentStructures = (parents==null)? parents : new List<StructuredObject>();
  }

  List<StructuredObject> get parents =>_parentStructures;

}