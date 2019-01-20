import 'dart:convert';

import 'package:OOSE/QueryBuilder/src/IWritable.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';

class Criteria implements IWritable{

  // Private variables
  String _column;
  String _operator;
  dynamic _value;

  // Constructor
  Criteria(String column, String operator, dynamic value){
    _column = column;
    _operator = operator;
    _value = value;
  }

  // Private methods
  String get valueToString{

    switch(_value.runtimeType){
      case String:
        String s = _value.toString();
        if(s.substring(0,1) == "("){return s;} // Early exit since its a sub query
        return (s.contains(".")) ? s : "'${s}'";
        break;
      case Null:
        return "NULL";
        break;
    }

    return htmlEscape.convert(_value.toString());
  }

  // Render method
  @override
  String toString() {
    return ArrayUtils.JoinList([_column, _operator, valueToString], " ");
  }

  @override
  int Order() {
    return 0;
  }
}