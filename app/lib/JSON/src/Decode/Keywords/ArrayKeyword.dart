import 'package:OOSE/JSON/src/Decode/Keywords/IKeyword.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';

class ArrayKeyword implements IKeyword{

  @override
  KeywordCategories Category() {
    return KeywordCategories.SingleOperator;
  }

  @override
  String TriggerCharacter() {
    return "[";
  }

}