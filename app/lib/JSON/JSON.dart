import 'package:OOSE/JSON/src/JSONDecoder.dart';
import 'package:OOSE/JSON/src/JSONEncoder.dart';

class JSON{
  // Static methods
  static String Encode(dynamic object){
    return new JSONEncoder().Encode(object);
  }

  static T Decode<T>(String json){
    return new JSONDecoder().Decode(json);
  }
}