import 'package:OOSE/DocumentBuilder/DocumentCompilerTemplate.dart';
import 'package:OOSE/DocumentBuilder/StructuredObject.dart';
import 'package:OOSE/DocumentBuilder/StructuredObjectDocument.dart';

class HTMLCompiler extends DocumentCompilerTemplate{

  String _output = "";
  String get output => _output;

  HTMLCompiler(StructuredObjectDocument document) : super(document);

  @override
  void compile(StructuredObject object) {
    _output+=_buildElement(object);
  }

  /**
   * Builds a single element with all its childs
   */
  String _buildElement(StructuredObject object){
    String body = (object.value!=null) ? object.value : _buildBodyFromChilds(object.children);
    String attributes = _buildAttributes(object.attributes);
    return "<${object.type}${attributes}>${body}</${object.type}>";
  }

  /**
   * Builds the element body
   */
  String _buildBodyFromChilds(List<StructuredObject> objects){
    String result = "";
    objects.forEach((object){
      result+=_buildElement(object);
    });
    return result;
  }

  /**
   * Builds attributes
   */
  String _buildAttributes(Map<String,String> attributes){
    String result="";
    attributes.forEach((key,value){
      result+=" \"${key}\"=\"${value}\"";
    });
    return result;
  }

}