import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';

class Token{
  ParserCategories _type;
  String _value;

  Token(ParserCategories type, String value){
    _type = type;
    _value = value;
  }

  // Getters
  ParserCategories get Type => _type;
  String get Value => _value;
  String get Identifier {
    return _type.toString() + _value;
  }
}