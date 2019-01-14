import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';

class ConstantNode extends ANode{

  // Private variables
  String _value;

  ConstantNode(String value){
    _value = value;
  }

  @override
  String Type() {
    return "Constant";
  }

  // Getters
  String get Value => _value;
}