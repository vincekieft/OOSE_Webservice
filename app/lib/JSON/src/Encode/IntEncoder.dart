import 'package:OOSE/JSON/src/Encode/IEncoder.dart';

class IntEncoder implements IEncoder{

  @override
  Type ParseType() {
    return int;
  }

  @override
  String Encode(dynamic value) {
    return value.toString();
  }

  @override
  int Priority() {
    return 10;
  }

  @override
  bool IsOfType(object) {
    return object is int;
  }

}