import 'package:OOSE/JSON/src/Decode/Collectors/ACollectorTemplate.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';

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
  KeywordCategories TokenType() {
    return KeywordCategories.Keyword;
  }

}