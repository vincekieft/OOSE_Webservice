import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ConstantNode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/IParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';

class ConstantParser extends IParser{

  @override
  ParserCategories Category() {
    return ParserCategories.Constant;
  }

  @override
  ANode ResolveToken(TokenIterator iterator) {
    ConstantNode constant = new ConstantNode(iterator.CurrentToken.Value);
    return constant;
  }

  @override
  String TriggerCharacter() {
    return "";
  }

}