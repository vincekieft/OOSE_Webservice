import 'package:OOSE/JSON/src/JSONDecoder.dart';
import 'package:OOSE/JSON/src/JSONEncoder.dart';

export 'src/Annotations/JSONIgnore.dart';
export 'src/Annotations/JSONList.dart';
export 'src/Annotations/JSONObject.dart';
export 'src/Annotations/JSONDate.dart';

class JSON{
  // Static methods
  static String Encode(dynamic object){
    return new JSONEncoder().Encode(object);
  }

  static T Decode<T>(String json){
    return new JSONDecoder().Decode<T>(json);
  }
}