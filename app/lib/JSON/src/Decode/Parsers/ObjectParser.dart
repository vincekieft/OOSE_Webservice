import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ObjectNode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/IParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';

class ObjectParser implements IParser{

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
      object.AddVariable(iterator.NextOperator().ResolveToken(iterator));
    }

    return object;
  }

}