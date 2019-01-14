import 'package:OOSE/JSON/src/Decode/Parsers/ArrayParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ConstantParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/VariableParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/IParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ObjectParser.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';

class TokenIterator{

  // private variables
  int _index = 0;
  List<Token> _tokens;
  Map<String, IParser> _operator_parsers = new Map<String, IParser>();
  Map<String, IParser> _expression_parsers = new Map<String, IParser>();


  TokenIterator(List<Token> tokens){
    _tokens = tokens;

    // Add all supported operators
    _AddSupportedOperatorParser(new ObjectParser());
    _AddSupportedOperatorParser(new VariableParser());
    _AddSupportedOperatorParser(new ArrayParser());

    // Add all supported expressions
    _AddSupportedExpressionParser(new ConstantParser());
  }

  // Public methods
  IParser NextOperator(){
    while(!Empty){
      IParser keyword = _FindOperatorParserForToken(CurrentToken);
      _Step();
      if(keyword != null){ return keyword; }
    }

    return null;
  }

  IParser NextParser(){
    while(!Empty){
      IParser keyword = _FindParserForToken(CurrentToken);
      _Step();
      if(keyword != null){ return keyword; }
    }

    return null;
  }

  IParser GetRelativeParser(int offset){
    int relativeIndex = _index + offset;
    if(relativeIndex >= 0 && relativeIndex < _tokens.length){
      return _FindParserForToken(_tokens[relativeIndex]);
    }

    return null;
  }

  // Private methods
  void _Step(){
    _index ++;
  }

  IParser _FindParserForToken(Token token){
    IParser parser = _FindOperatorParserForToken(token);
    if(parser != null){ return parser; }

    return _FindExpressionParserForToken(token);
  }

  IParser _FindOperatorParserForToken(Token token){
    return _operator_parsers[token.Identifier];
  }

  IParser _FindExpressionParserForToken(Token token){
    return _expression_parsers[token.Identifier];
  }

  void _AddSupportedOperatorParser(IParser keyword){
    String identifier = keyword.Category().toString() + keyword.TriggerCharacter();
    _operator_parsers[identifier] = keyword;
  }

  void _AddSupportedExpressionParser(IParser keyword){
    String identifier = keyword.Category().toString() + keyword.TriggerCharacter();
    _expression_parsers[identifier] = keyword;
  }

  // Getters
  Token get CurrentToken => _tokens[_index];
  int get Length => _tokens.length;
  int get Index => _index;
  bool get Empty => _index >= _tokens.length;
}