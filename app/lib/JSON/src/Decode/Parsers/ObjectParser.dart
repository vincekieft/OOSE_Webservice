import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ObjectNode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/AParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';

class ObjectParser extends AParser{

  @override
  ParserCategories Category() {
    return ParserCategories.SingleOperator;
  }

  @override
  String TriggerCharacter() {
    return "{";
  }

  @override
  ANode ResolveToken(TokenIterator iterator) {
    ObjectNode object = new ObjectNode();

    while(iterator.CurrentToken.Value != "}" && !iterator.Empty){
      AParser parser = iterator.NextOperator(); // Step towards the next operator
      if(parser != null){
        object.AddVariable(parser.ResolveToken(iterator));
      }
    }

    iterator.NextParser(); // Step

    return object;
  }

}