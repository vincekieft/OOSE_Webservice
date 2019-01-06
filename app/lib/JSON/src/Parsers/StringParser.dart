import 'package:OOSE/JSON/src/Parsers/IParser.dart';

class StringParser implements IParser{

  @override
  Type parseType() {
    return String;
  }

  @override
  String encode(dynamic value) {
    return """${value.toString()}""";
  }

}