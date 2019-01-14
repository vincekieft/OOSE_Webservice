import 'package:OOSE/JSON/src/Encode/BoolEncoder.dart';
import 'package:OOSE/JSON/src/Encode/ClassEncoder.dart';
import 'package:OOSE/JSON/src/Encode/DoubleEncoder.dart';
import 'package:OOSE/JSON/src/Encode/IEncoder.dart';
import 'package:OOSE/JSON/src/Encode/IntEncoder.dart';
import 'package:OOSE/JSON/src/Encode/ListEncoder.dart';
import 'package:OOSE/JSON/src/Encode/StringEncoder.dart';

class JSONEncoder{

  // Private variables
  List<IEncoder> _parsers;
  IEncoder _default;

  JSONEncoder(){
    _InitializeParsers();
  }

  // Public methods
  String Encode(dynamic object){
    return _FindParserFor(object).Encode(object);
  }

  // Private methods
  void _InitializeParsers(){
    _parsers = new List<IEncoder>();

    // Add all parsers
    _AddParser(new StringEncoder());
    _AddParser(new IntEncoder());
    _AddParser(new ListEncoder());
    _AddParser(new ClassEncoder());
    _AddParser(new DoubleEncoder());
    _AddParser(new BoolEncoder());

    // Sort parsers
    _SortParsers();
  }

  void _AddParser(IEncoder parser){
    _parsers.add(parser);
  }

  void _SortParsers(){
    _parsers.sort((IEncoder a, IEncoder b) => b.Priority().compareTo(a.Priority()));
  }

  IEncoder _FindParserFor(dynamic object){
    for (IEncoder parser in _parsers) {
      if (parser.IsOfType(object)) {
        return parser;
      }
    }

    return null;
  }
}