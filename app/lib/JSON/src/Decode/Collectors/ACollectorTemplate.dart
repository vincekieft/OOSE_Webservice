import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';

abstract class ACollectorTemplate{
  // Private variables
  String _characterSeries = "";

  // Abstract methods
  String SearchString();
  ParserCategories TokenType();

  // Public methods
  bool Feed(String character){
    _characterSeries += character;
  }

  bool IsTokenFor(String character){
    return SearchString().contains(character);
  }

  Token ResetToken(){
    Token token = CreateToken();
    _characterSeries = "";
    return token;
  }

  Token CreateToken(){
    return new Token(TokenType(),_characterSeries);
  }

  // Getters
  String get LastCharacter => _characterSeries[_characterSeries.length -1];
  String get FirstCharacter => _characterSeries[0];
  String get CharacterSeries => _characterSeries;
  int get Length => _characterSeries.length;
}