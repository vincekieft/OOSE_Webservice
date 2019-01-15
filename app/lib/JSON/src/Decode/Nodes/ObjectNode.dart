import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';

class ObjectNode extends ANode{

  // Private variables
  List<ANode> _variables = new List<ANode>();

  // Public methods
  void AddVariable(ANode variable){
    _variables.add(variable);
  }

  @override
  String Type() {
    return "Object";
  }

  // Getters
  List<ANode> get Variables => _variables;

}