import 'package:OOSE/JSON/src/JSONEncoder.dart';
import 'package:OOSE/JSON/src/Parsers/IParser.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';

class ListParser implements IParser{

  @override
  Type ParseType() {
    return List;
  }

  @override
  String Encode(dynamic value) {
    List list = value as List;
    List<String> variables = new List<String>();
    JSONEncoder encoder = new JSONEncoder();

    for (var item in list) {
      variables.add(encoder.Encode(item));
    }

    return "[${ ArrayUtils.JoinList(variables, ",") }]";
  }

  @override
  int Priority() {
    return 10;
  }

  @override
  bool IsOfType(object) {
    return object is List;
  }

}