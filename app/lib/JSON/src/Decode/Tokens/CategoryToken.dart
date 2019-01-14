import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';

class CategoryToken extends Token{

  CategoryToken(ParserCategories type, String value) : super(type, value);

  @override
  String get Identifier {
    return this.Type.toString();
  }
}