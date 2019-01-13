import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';
import 'package:OOSE/JSON/src/Decode/Token.dart';

abstract class ACollectorTemplate{
  // Private variables
  String _characterSeries = "";

  // Abstract methods
  String SearchString();
  KeywordCategories TokenType();

  // Public methods
  bool Feed(String character){
    _characterSeries += character;
  }

  bool IsTokenFor(String character){
    return SearchString().contains(character);
  }

  Token ResetToken(){
    String lastSeries = _characterSeries;
    _characterSeries = "";
    return new Token(TokenType(),lastSeries);
  }

  // Getters
  String get LastCharacter => _characterSeries[_characterSeries.length -1];
  String get FirstCharacter => _characterSeries[0];
  int get Length => _characterSeries.length;
}