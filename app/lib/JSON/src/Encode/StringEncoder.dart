import 'package:OOSE/JSON/src/Encode/IEncoder.dart';
import 'package:sqljocky5/results/blob.dart';

class StringEncoder implements IEncoder{

  @override
  Type ParseType() {
    return String;
  }

  @override
  String Encode(dynamic value) {
    return "\"${value.toString()}\"";
  }

  @override
  bool IsOfType(object) {
    return object is String || object is Blob;
  }

  @override
  int Priority() {
    return 10;
  }

}