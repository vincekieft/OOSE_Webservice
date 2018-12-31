import 'package:OOSE/ORM/src/Result/QueryRow.dart';

class QueryResult{

  // Private variables
  int _insertId;
  List<QueryRow> _rows = new List<QueryRow>();

  // Public methods
  void SetRows(List<QueryRow> rows, int insertId){
    _rows = rows;
    _insertId = insertId;
  }

  // Getters
  List<QueryRow> get Rows => _rows;
  int get InsertId => _insertId;
}