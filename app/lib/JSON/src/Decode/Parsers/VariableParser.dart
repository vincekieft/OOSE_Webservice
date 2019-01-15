import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ConstantNode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/VariableNode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/AParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';

class VariableParser extends AParser{

  @override
  ParserCategories Category() {
    return ParserCategories.SingleOperator;
  }

  @override
  String TriggerCharacter() {
    return ":";
  }

  @override
  ANode ResolveToken(TokenIterator iterator) {
    return new VariableNode(
      iterator.GetRelativeParser(-2).ResolveToken(iterator),
      iterator.NextParser().ResolveToken(iterator)
    );
  }

  // Private methods

}