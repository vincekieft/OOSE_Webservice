import 'package:OOSE/JSON/src/Decode/Collectors/ACollectorTemplate.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';

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
  KeywordCategories TokenType() {
    return KeywordCategories.String;
  }
}