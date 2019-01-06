import 'package:OOSE/JSON/src/Parsers/IParser.dart';
import 'package:OOSE/JSON/src/Parsers/StringParser.dart';

class JSONEncoder{

  // Private variables
  Map<Type, IParser> _parsers;

  JSONEncoder(){
    _InitializeParsers();
  }

  // Private variables
  void _InitializeParsers(){
    _parsers = new Map<Type, IParser>();

    // Add all parsers
    _AddParser(new StringParser());
  }

  void _AddParser(IParser parser){
    _parsers[parser.parseType()] = parser;
  }

}