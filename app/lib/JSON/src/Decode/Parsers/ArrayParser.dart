import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ArrayNode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/IParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';

class ArrayParser implements IParser{

  @override
  ParserCategories Category() {
    return ParserCategories.SingleOperator;
  }

  @override
  String TriggerCharacter() {
    return "[";
  }

  @override
  ANode ResolveToken(TokenIterator iterator) {
    ArrayNode array = new ArrayNode();

    while(iterator.CurrentToken.Value != "]" && !iterator.Empty){
      array.AddListItem(iterator.NextParser().ResolveToken(iterator));
    }

    return array;
  }
}