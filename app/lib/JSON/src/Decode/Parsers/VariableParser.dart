import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/VariableNode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/IParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';

class VariableParser implements IParser{

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
      iterator.GetRelativeParser(-1).ResolveToken(iterator),
      iterator.GetRelativeParser(1).ResolveToken(iterator)
    );
  }
}