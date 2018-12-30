import 'package:OOSE/QueryBuilder/src/IWritable.dart';

class Criteria implements IWritable{

  // Private variables
  String _column;
  String _operator;
  String _value;

  // Constructor
  Criteria(String column, String operator, String value){
    _column = column;
    _operator = operator;
    _value = value;
  }

  // Render method
  @override
  String toString() {
    return "${_column} ${_operator} '${_value}'";
  }

  @override
  int Order() {
    return 0;
  }
}