import 'package:OOSE/JSON/src/JSONEncoder.dart';

class JSON{
  // Static methods
  static String Encode(dynamic object){
    JSONEncoder encoder = new JSONEncoder();
    return encoder.Encode(object);
  }
}