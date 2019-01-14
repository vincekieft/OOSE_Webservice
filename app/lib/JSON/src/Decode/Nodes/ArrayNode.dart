import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';

class ArrayNode extends ANode{

  // Private variables
  List<ANode> _list = new List<ANode>();

  // Public methods
  void AddListItem(ANode node){
    _list.add(node);
  }

  @override
  String Type() {
    return "Array";
  }

}