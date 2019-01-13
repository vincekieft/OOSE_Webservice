import 'package:OOSE/JSON/src/Decode/AbstractSyntaxTree.dart';

class JSONDecoder{
  // Public methods
  T Decode<T>(String json){
    AbstractSyntaxTree tree = new AbstractSyntaxTree(json);
  }
}