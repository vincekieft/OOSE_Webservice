import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ArrayNode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/AParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';

class ArrayParser extends AParser{

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
      AParser parser = iterator.NextParser(); // Step towards the next operator
      if(parser != null){
        array.AddListItem(parser.ResolveToken(iterator));
      }
    }

    iterator.NextParser(); // Step

    return array;
  }
}