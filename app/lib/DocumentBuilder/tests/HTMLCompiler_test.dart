import 'package:OOSE/DocumentBuilder/DataStructureBuilder.dart';
import 'package:OOSE/DocumentBuilder/HTMLCompiler.dart';
import 'package:OOSE/DocumentBuilder/StructuredObject.dart';
import 'package:OOSE/DocumentBuilder/StructuredObjectDocument.dart';
import 'package:test_api/test_api.dart';

void main(){

  test("H1 name value and attribute test",(){
    DataStructureBuilder builder = new DataStructureBuilder();
    StructuredObject h1 = new StructuredObject();

    h1.type = "h1";
    h1.value = "Hello there!";
    h1.addAttribute("color", "red");

    builder.addStructure(h1);
    StructuredObjectDocument document = builder.build();
    HTMLCompiler compiler = new HTMLCompiler(document);
    expect(compiler.output,"<h1 \"color\"=\"red\">Hello there!</h1>");
  });

  test("DIV with childs test",(){
    DataStructureBuilder builder = new DataStructureBuilder();
    StructuredObject div = new StructuredObject();
    StructuredObject h1 = new StructuredObject();

    h1.type = "h1";
    h1.value = "Hello there!";
    div.type = "div";
    div.addChild(h1);

    builder.addStructure(div);
    StructuredObjectDocument document = builder.build();
    HTMLCompiler compiler = new HTMLCompiler(document);
    expect(compiler.output,"<div><h1>Hello there!</h1></div>");
  });


}