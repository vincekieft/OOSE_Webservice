import 'package:OOSE/JSON/src/Decode/Nodes/ANode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ConstantNode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/ObjectNode.dart';
import 'package:OOSE/JSON/src/Decode/Nodes/VariableNode.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/AParser.dart';
import 'package:OOSE/JSON/src/Decode/Parsers/ObjectParser.dart';
import 'package:OOSE/JSON/src/Decode/Tokens/Token.dart';
import 'package:OOSE/JSON/src/Decode/TokenIterator.dart';
import 'package:OOSE/JSON/src/Decode/Tokenizer.dart';

class AbstractSyntaxTree{

  // Private variables
  Tokenizer _lexer;
  List<ANode> _rootNodes;

  AbstractSyntaxTree(String json){
    _lexer = new Tokenizer(json);

    _rootNodes = BuildSyntaxTree();
  }

  // Public methods
  List<ANode> BuildSyntaxTree(){
    List<Token> tokens = _lexer.BuildTokenList();
    TokenIterator iterator = new TokenIterator(tokens);

    List<ANode> rootNodes = new List<ANode>();

    while(!iterator.Empty){
      AParser parser = iterator.NextOperator();
      if(parser != null){
        rootNodes.add(_ResolveKeyword(parser, iterator));
      }
    }

    return rootNodes;
  }

  // Private methods
  ANode _ResolveKeyword(AParser keyword, TokenIterator iterator){
    if(keyword != null){
      return keyword.ResolveToken(iterator);
    }

    return null;
  }

  // Getters
  List<ANode> get RootNodes => _rootNodes;
}