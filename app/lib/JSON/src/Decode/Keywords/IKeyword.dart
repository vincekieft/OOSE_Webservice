import 'package:OOSE/JSON/src/Decode/Keywords/KeywordEnums.dart';

abstract class IKeyword{
  KeywordCategories Category();
  String TriggerCharacter();
}