import 'package:OOSE/DocumentBuilder/StructuredObject.dart';
import 'package:OOSE/DocumentBuilder/StructuredObjectDocument.dart';

abstract class DocumentCompilerTemplate {

  DocumentCompilerTemplate(StructuredObjectDocument document){
    travel(document);
  }

  /**
   * Travels the document structure
   */
  void travel(StructuredObjectDocument document,[Function callback]){
    Function method = (callback==null)? compile : callback;
    document.parents.forEach((parent)=>method(parent));
  }

  /**
   * Abstract compile method
   */
  void compile(StructuredObject object);
}