import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ParserEnums.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';

abstract class AParser{

  // Private variables
  Token _targetToken;

  // Abstract methods
  ParserCategories Category();
  String TriggerCharacter();
  ANode ResolveToken(TokenIterator iterator);

  // Public methods
  void SetTargetToken(Token token){
    _targetToken = token;
  }

  // Getters
  Token get TargetToken => _targetToken;
}