import 'package:OOSE/JSON/src/Parsers/StringParser.dart';

class BoolParser extends StringParser{

  @override
  Type ParseType() {
    return bool;
  }

  @override
  bool IsOfType(object) {
    return object is bool;
  }

}