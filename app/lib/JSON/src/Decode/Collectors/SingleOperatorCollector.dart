import 'package:OOSE/JSON/src/Decode/Collectors/ACollectorTemplate.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';

class SingleOperatorCollector extends ACollectorTemplate{
  @override
  bool Feed(String character){
    if(Length >= 1){ return false; }
    super.Feed(character);
    return true;
  }

  @override
  String SearchString() {
    return "{}:[],";
  }

  @override
  KeywordCategories TokenType() {
    return KeywordCategories.SingleOperator;
  }
}