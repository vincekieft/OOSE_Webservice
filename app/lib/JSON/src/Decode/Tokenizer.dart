import 'package:OOSE/JSON/src/Decode/Collectors/ACollectorTemplate.dart';
import 'package:OOSE/JSON/src/Decode/Collectors/KeywordCollector.dart';
import 'package:OOSE/JSON/src/Decode/Collectors/NumberCollector.dart';
import 'package:OOSE/JSON/src/Decode/Collectors/MultiOperatorCollector.dart';
import 'package:OOSE/JSON/src/Decode/Collectors/SingleOperatorCollector.dart';
import 'package:OOSE/JSON/src/Decode/Collectors/StringCollector.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';

class Tokenizer{

  // Private variables
  String _json;
  ACollectorTemplate _currentToken;
  List<ACollectorTemplate> _tokens;

  Tokenizer(String json){
    _json = json;

    _tokens = [
      new KeywordCollector(),
      new StringCollector(),
      new MultiOperatorCollector(),
      new NumberCollector(),
      new SingleOperatorCollector()
    ];
  }

  // Public methods
  List<Token> BuildTokenList(){
    _ResetCurrentToken(); // Makes sure you always start clean
    List<Token> tokens = new List<Token>();

    for(int i = 0; i < _json.length; i++){
      String character = _json[i];
      _EnsureTokenFor(character);

      if(_currentToken == null){continue;} // Current character doesn't have a token to resolve it

      if(!_currentToken.Feed(character)){ // Check whether the token used the character
        _ResolveToken(tokens);
        i--; // Make sure unused token is evaluated again
      }
    }

    _ResolveToken(tokens); // Resolve last token

    return tokens;
  }

  // Private methods
  void _EnsureTokenFor(String character){
    if(_currentToken == null){  _currentToken = _FindTokenFor(character); }
  }

  void _ResolveToken(List<Token> tokens){
    if(_currentToken != null) {
      tokens.add(_currentToken.ResetToken());
      _ResetCurrentToken();
    }
  }

  void _ResetCurrentToken(){
    _currentToken = null; // Empty token
  }

  ACollectorTemplate _FindTokenFor(String character){
    for (ACollectorTemplate token in _tokens) {
      if(token.IsTokenFor(character)){
        return token;
      }
    }

    return null;
  }
}