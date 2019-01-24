import 'package:OOSE/DocumentBuilder/StructuredObject.dart';
import 'package:OOSE/DocumentBuilder/StructuredObjectDocument.dart';

abstract class DocumentCompilerTemplate {

  DocumentCompilerTemplate(StructuredObjectDocument document){
    travel(document);
  }

  /**
   * Travels the document structure
   */
  travel(StructuredObjectDocument document){
    document.parents.forEach((parent){
      compile(parent);
      parent.children.forEach((object)=>compile(object));
    });
  }

  /**
   * Abstract compile method
   */
  compile(StructuredObject object);
}