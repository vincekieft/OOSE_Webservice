import 'package:OOSE/JSON/src/Decode/Collectors/ACollectorTemplate.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';

class MultiOperatorCollector extends ACollectorTemplate{

  @override
  bool Feed(String character){
    if(!SearchString().contains(character)){ return false; }
    super.Feed(character);
    return true;
  }

  @override
  String SearchString() {
    return "-+=!&*";
  }

  @override
  ParserCategories TokenType() {
    return ParserCategories.MultiOperator;
  }
}