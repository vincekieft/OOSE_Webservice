import 'package:OOSE/JSON/src/Encode/StringEncoder.dart';

class DoubleEncoder extends StringEncoder{

  @override
  Type ParseType() {
    return double;
  }

  @override
  bool IsOfType(object) {
    return object is double;
  }

}