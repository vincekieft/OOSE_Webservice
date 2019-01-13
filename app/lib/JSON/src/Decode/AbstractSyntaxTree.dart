import 'package:OOSE/JSON/src/Decode/Keywords/ArrayKeyword.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/ColonKeyword.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/CommaKeyword.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/IKeyword.dart';
import 'package:OOSE/JSON/src/Decode/Keywords/ObjectKeyword.dart';
import 'package:OOSE/JSON/src/Decode/Token.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';
import 'package:OOSE/JSON/src/Decode/Tokenizer.dart';

class AbstractSyntaxTree{

  // Private variables
  Tokenizer _lexer;
  Map<String, IKeyword> _keywords = new Map<String, IKeyword>();

  AbstractSyntaxTree(String json){
    _lexer = new Tokenizer(json);

    // Add all supported keywords
    _AddSupportedKeyword(new ObjectKeyword());
    _AddSupportedKeyword(new ColonKeyword());
    _AddSupportedKeyword(new ArrayKeyword());
    _AddSupportedKeyword(new CommaKeyword());

    BuildSyntaxTree();
  }

  // Public methods
  void BuildSyntaxTree(){
    List<Token> tokens = _lexer.BuildTokenList();
    TokenIterator iterator = new TokenIterator(tokens);
    
    Token current = iterator.CurrentToken;

    for(int i = iterator.Index; i < iterator.Length; i++){
      iterator.Step();
      if(iterator.CurrentToken != null && iterator.CurrentToken.Value == "}"){
        print("Found exit");
      }
    }
  }

  // Private methods
  IKeyword _FindKeywordForToken(Token token){
    return _keywords[token.Identifier];
  }

  void _AddSupportedKeyword(IKeyword keyword){
    String identifier = keyword.Category().toString() + keyword.TriggerCharacter();
    _keywords[identifier] = keyword;
  }

}