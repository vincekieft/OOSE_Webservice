import 'package:OOSE/JSON/src/Decode/Collectors/ACollectorTemplate.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/CategoryToken.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';

class StringCollector extends ACollectorTemplate {
  @override
  bool Feed(String character){
    if(Length > 1 && LastCharacter == "\""){ return false; }
    super.Feed(character);
    return true;
  }

  @override
  String SearchString() {
    return "\"";
  }

  @override
  ParserCategories TokenType() {
    return ParserCategories.Constant;
  }

  @override
  Token CreateToken(){
    return new CategoryToken(TokenType(),CharacterSeries);
  }
}