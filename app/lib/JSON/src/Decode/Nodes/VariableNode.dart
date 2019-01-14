import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';

class VariableNode extends ANode{

  // Private variables
  ANode _identifier;
  ANode _value;


  VariableNode(ANode identifier, ANode value){
    _identifier = identifier;
    _value = value;
  }

  @override
  String Type() {
    return "Variable";
  }

  // Getters
  ANode get Identifier => _identifier;
  ANode get Value => _value;
}