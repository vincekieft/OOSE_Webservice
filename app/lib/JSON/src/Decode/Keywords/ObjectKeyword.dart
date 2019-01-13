import 'package:OOSE/JSON/src/Decode/Keywords/IKeyword.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';

class ObjectKeyword implements IKeyword{

  // Private variables
  List variables = new List();

  @override
  KeywordCategories Category() {
    return KeywordCategories.SingleOperator;
  }

  @override
  String TriggerCharacter() {
    return "{";
  }

}