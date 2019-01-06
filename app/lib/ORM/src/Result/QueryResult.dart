import 'package:OOSE/ORM/src/Result/QueryRow.dart';

class QueryResult{

  // Private variables
  int _insertId;
  List<QueryRow> _rows = new List<QueryRow>();
  List<String> _fields = new List<String>();
  List<String> _tables = new List<String>();


  // Public methods
  void SetInsertedID(int insertId){
    _insertId = insertId;
  }

  void SetRows(List<QueryRow> rows, int insertId){
    _rows = rows;
    SetInsertedID(insertId);
  }

  void SetFields(List<String> fields){
    _fields = fields;
  }

  SetFieldTables(List<String> tables){
    _tables = tables;
  }

  // Getters
  List<QueryRow> get Rows => _rows;
  List<String> get Fields => _fields;
  List<String> get Tables => _tables;
  int get InsertId => _insertId;
}