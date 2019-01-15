import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ConstantNode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/AParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';

class ConstantParser extends AParser{

  @override
  ParserCategories Category() {
    return ParserCategories.Constant;
  }

  @override
  ANode ResolveToken(TokenIterator iterator) {
    ConstantNode constant = new ConstantNode(TargetToken.Value);
    return constant;
  }

  @override
  String TriggerCharacter() {
    return "";
  }

}