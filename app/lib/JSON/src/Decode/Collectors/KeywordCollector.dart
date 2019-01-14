import 'package:OOSE/JSON/src/Decode/Collectors/ACollectorTemplate.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/CategoryToken.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';

class KeywordCollector extends ACollectorTemplate{

  @override
  bool Feed(String character){
    if(character == " "){return false;}
    super.Feed(character);
    return true;
  }

  @override
  String SearchString() {
    return "abcdefghijklmnopqrstuvwxyz";
  }

  @override
  ParserCategories TokenType() {
    return ParserCategories.Keyword;
  }

  @override
  Token CreateToken(){
    return new CategoryToken(TokenType(),CharacterSeries);
  }
}