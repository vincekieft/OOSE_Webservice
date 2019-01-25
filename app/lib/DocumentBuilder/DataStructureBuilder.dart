import 'package:OOSE/DocumentBuilder/StructuredObject.dart';
import 'package:OOSE/DocumentBuilder/StructuredObjectDocument.dart';

class DataStructureBuilder{

  StructuredObjectDocument _document = new StructuredObjectDocument();

  /**
   * Adds a structured object to the document
   */
  void addStructure(StructuredObject object){
    _document.parents.add(object);
  }

  /**
   * Returns document
   */
  StructuredObjectDocument build(){
    return _document;
  }
}