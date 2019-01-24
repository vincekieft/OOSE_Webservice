import 'package:OOSE/DocumentBuilder/DataStructureBuilder.dart';
import 'package:OOSE/DocumentBuilder/HTMLCompiler.dart';
import 'package:OOSE/DocumentBuilder/StructuredObject.dart';
import 'package:OOSE/DocumentBuilder/StructuredObjectDocument.dart';
import 'package:test_api/test_api.dart';

void main(){
  test("Create html from test user data",(){
    TestUser user = new TestUser("Henk");
    TestUserAdapter adapter = new TestUserAdapter(user);
    DataStructureBuilder builder = new DataStructureBuilder();
    StructuredObject object = adapter.createWelcomeWidget();

    builder.addStructure(object);
    StructuredObjectDocument document = builder.build();

    HTMLCompiler compiler = new HTMLCompiler(document);
    expect(compiler.output,"<h1>Hallo Henk</h1>");
  });
}

class TestUser{

  String _name;
  String get name =>_name;

  TestUser(String name){
    _name = name;
  }
}

class TestUserAdapter{

  TestUser get testUser=>_testUser;
  TestUser _testUser;

  TestUserAdapter(TestUser testUser){
    _testUser = testUser;
  }

  StructuredObject createWelcomeWidget(){
    StructuredObject titleObject = new StructuredObject();
    titleObject.type = "h1";
    titleObject.value = "Hallo ${testUser.name}";
    return titleObject;
  }
}