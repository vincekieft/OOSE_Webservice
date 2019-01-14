import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/IParser.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';
import 'package:OOSE/JSON/src/Decode/Tokenizer.dart';

class AbstractSyntaxTree{

  // Private variables
  Tokenizer _lexer;

  AbstractSyntaxTree(String json){
    _lexer = new Tokenizer(json);

    BuildSyntaxTree();
  }

  // Public methods
  void BuildSyntaxTree(){
    List<Token> tokens = _lexer.BuildTokenList();
    TokenIterator iterator = new TokenIterator(tokens);

    List<ANode> rootNodes = new List<ANode>();
    IParser parser = iterator.NextOperator();

    while(parser != null){
      rootNodes.add(_ResolveKeyword(iterator.NextParser(), iterator));
    }

    print(rootNodes.length);
  }

  // Private methods
  ANode _ResolveKeyword(IParser keyword, TokenIterator iterator){
    if(keyword != null){
      return keyword.ResolveToken(iterator);
    }

    return null;
  }
}