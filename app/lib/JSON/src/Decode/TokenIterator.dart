import 'package:OOSE/JSON/src/Decode/Parsers/ArrayParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ConstantParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/VariableParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/AParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ObjectParser.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';

class TokenIterator{

  // private variables
  int _index = 0;
  List<Token> _tokens;
  Map<String, AParser> _operator_parsers = new Map<String, AParser>();
  Map<String, AParser> _expression_parsers = new Map<String, AParser>();


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
  AParser NextOperator(){
    AParser parser = _FindOperatorParserForToken(CurrentToken);
    _Step();
    return parser;
  }

  AParser NextParser(){
    AParser keyword = _FindParserForToken(CurrentToken);
    _Step();
    return keyword;
  }

  AParser GetRelativeParser(int offset){
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

  AParser _FindParserForToken(Token token){
    AParser parser = _FindOperatorParserForToken(token);
    if(parser != null){ return parser; }

    return _FindExpressionParserForToken(token);
  }

  AParser _FindOperatorParserForToken(Token token){
    return _EnsureCurrentToken(_operator_parsers[token.Identifier],token);
  }

  AParser _FindExpressionParserForToken(Token token){
    return _EnsureCurrentToken(_expression_parsers[token.Identifier],token);
  }

  AParser _EnsureCurrentToken(AParser parser, Token token){
    if(parser != null){ parser.SetTargetToken(token); }
    return parser;
  }

  void _AddSupportedOperatorParser(AParser keyword){
    String identifier = keyword.Category().toString() + keyword.TriggerCharacter();
    _operator_parsers[identifier] = keyword;
  }

  void _AddSupportedExpressionParser(AParser keyword){
    String identifier = keyword.Category().toString() + keyword.TriggerCharacter();
    _expression_parsers[identifier] = keyword;
  }

  // Getters
  Token get CurrentToken => _tokens[_index];
  int get Length => _tokens.length;
  int get Index => _index;
  bool get Empty => _index >= _tokens.length;
}