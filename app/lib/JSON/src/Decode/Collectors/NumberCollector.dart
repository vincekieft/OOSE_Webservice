import 'package:OOSE/JSON/src/Decode/Collectors/ACollectorTemplate.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';

class NumberCollector extends ACollectorTemplate {
  @override
  bool Feed(String character){
    if(!isNumeric(character)){return false;}
    super.Feed(character);
    return true;
  }

  @override
  String SearchString() {
    return "0123456789";
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  @override
  KeywordCategories TokenType() {
    return KeywordCategories.Number;
  }
}