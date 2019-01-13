import 'package:OOSE/JSON/src/Decode/Keywords/IKeyword.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';

class CommaKeyword implements IKeyword{

  @override
  KeywordCategories Category() {
    return KeywordCategories.SingleOperator;
  }

  @override
  String TriggerCharacter() {
    return ",";
  }

}