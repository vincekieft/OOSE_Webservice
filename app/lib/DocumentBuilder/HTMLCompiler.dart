import 'package:OOSE/DocumentBuilder/DocumentCompilerTemplate.dart';
import 'package:OOSE/DocumentBuilder/StructuredObject.dart';
import 'package:OOSE/DocumentBuilder/StructuredObjectDocument.dart';

class HTMLCompiler extends DocumentCompilerTemplate{

  String _output = "";
  String get output => _output;

  HTMLCompiler(StructuredObjectDocument document) : super(document);

  @override
  void compile(StructuredObject object) {
    _output+=buildElement(object);
  }

  /**
   * Builds a single element with all its childs
   */
  String buildElement(StructuredObject object){
    String body = (object.value!=null)? object.value : buildBodyFromChilds(object.children);
    String attributes = buildAttributes(object.attributes);
    return "<${object.type}${attributes}>${body}</${object.type}>";
  }

  /**
   * Builds the element body
   */
  String buildBodyFromChilds(List<StructuredObject> object){
    String result = "";
    object.forEach((object){
      result+=buildElement(object);
    });
    return result;
  }

  /**
   * Builds attributes
   */
  String buildAttributes(Map<String,String> attributes){
    String result="";
    attributes.forEach((key,value){
      result+=" \"${key}\"=\"${value}\"";
    });
    return result;
  }

}