import 'package:OOSE/JSON/src/Decode/AbstractSyntaxTree.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';

class JSONDecoder{
  // Public methods
  T Decode<T>(String json){
    AbstractSyntaxTree tree = new AbstractSyntaxTree(json);

  }

  T ResolveObject<T>(ANode objectNode){

  }
}