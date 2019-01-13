import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';

class Token{
  KeywordCategories _type;
  String _value;

  Token(KeywordCategories type, String value){
    _type = type;
    _value = value;
  }

  // Getters
  KeywordCategories get Type => _type;
  String get Value => _value;
  String get Identifier {
    return _type.toString() + _value;
  }
}