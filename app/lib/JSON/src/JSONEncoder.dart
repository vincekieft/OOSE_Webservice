import 'package:OOSE/JSON/src/Encode/BoolParser.dart';
import 'package:OOSE/JSON/src/Encode/ClassParser.dart';
import 'package:OOSE/JSON/src/Encode/DoubleParser.dart';
import 'package:OOSE/JSON/src/Encode/IParser.dart';
import 'package:OOSE/JSON/src/Encode/IntParser.dart';
import 'package:OOSE/JSON/src/Encode/ListParser.dart';
import 'package:OOSE/JSON/src/Encode/StringParser.dart';

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