import 'package:OOSE/JSON/src/Decode/Token.dart';

class TokenIterator{

  // private variables
  int _index = 0;
  List<Token> _tokens;


  TokenIterator(List<Token> tokens){
    _tokens = tokens;
  }

  // Public methods
  void Step(){
    _index ++;
  }

  // Getters
  Token get CurrentToken => _tokens[_index];
  int get Length => _tokens.length;
  int get Index => _index;
}