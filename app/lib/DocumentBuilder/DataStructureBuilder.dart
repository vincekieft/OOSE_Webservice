import 'package:OOSE/DocumentBuilder/StructuredObject.dart';
import 'package:OOSE/DocumentBuilder/StructuredObjectDocument.dart';

class DataStructureBuilder{

  StructuredObjectDocument document = new StructuredObjectDocument();

  /**
   * Adds a structured object to the document
   */
  void addStructure(StructuredObject object){
    document.parents.add(object);
  }

  /**
   * Returns document
   */
  StructuredObjectDocument build(){
    return document;
  }
}