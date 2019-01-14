import 'package:OOSE/JSON/src/Encode/StringEncoder.dart';

class BoolEncoder extends StringEncoder{

  @override
  Type ParseType() {
    return bool;
  }

  @override
  bool IsOfType(object) {
    return object is bool;
  }

}