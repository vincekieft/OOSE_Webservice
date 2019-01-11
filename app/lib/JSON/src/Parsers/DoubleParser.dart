import 'package:OOSE/JSON/src/Parsers/StringParser.dart';

class DoubleParser extends StringParser{

  @override
  Type ParseType() {
    return double;
  }

  @override
  bool IsOfType(object) {
    return object is double;
  }

}