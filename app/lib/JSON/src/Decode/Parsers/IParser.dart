import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';

abstract class IParser{
  ParserCategories Category();
  String TriggerCharacter();
  ANode ResolveToken(TokenIterator iterator);
}