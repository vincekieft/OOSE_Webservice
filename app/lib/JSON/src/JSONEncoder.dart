import 'package:OOSE/JSON/src/Parsers/BoolParser.dart';
import 'package:OOSE/JSON/src/Parsers/ClassParser.dart';
import 'package:OOSE/JSON/src/Parsers/DoubleParser.dart';
import 'package:OOSE/JSON/src/Parsers/IParser.dart';
import 'package:OOSE/JSON/src/Parsers/IntParser.dart';
import 'package:OOSE/JSON/src/Parsers/ListParser.dart';
import 'package:OOSE/JSON/src/Parsers/StringParser.dart';

class JSONEncoder{

  // Private variables
  List<IParser> _parsers;
  IParser _default;

  JSONEncoder(){
    _InitializeParsers();
  }

  // Public methods
  String Encode(dynamic object){
    return _FindParserFor(object).Encode(object);
  }

  // Private methods
  void _InitializeParsers(){
    _parsers = new List<IParser>();

    // Add all parsers
    _AddParser(new StringParser());
    _AddParser(new IntParser());
    _AddParser(new ListParser());
    _AddParser(new ClassParser());
    _AddParser(new DoubleParser());
    _AddParser(new BoolParser());

    // Sort parsers
    _SortParsers();
  }

  void _AddParser(IParser parser){
    _parsers.add(parser);
  }

  void _SortParsers(){
    _parsers.sort((IParser a, IParser b) => b.Priority().compareTo(a.Priority()));
  }

  IParser _FindParserFor(dynamic object){
    for (IParser parser in _parsers) {
      if (parser.IsOfType(object)) {
        return parser;
      }
    }

    return null;
  }
}