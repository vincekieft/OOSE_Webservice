import 'package:OOSE/ORM/src/Result/QueryResult.dart';
import 'package:OOSE/ORM/src/Result/QueryRow.dart';
import 'package:sqljocky5/sqljocky.dart';

class SqlJockyAdapter extends QueryResult{

  SqlJockyAdapter(Results result){
    SetRows(AdaptRows(result), result.insertId);
    SetFields(AdaptFields(result, 1));
    SetFieldTables(AdaptFields(result, 0));
  }

  // Public methods
  List<String> AdaptFields(Results result, int splitSide){
    List<String> fields = new List<String>();
    result.fields.forEach((Field field) => fields.add(GetFieldName(field, splitSide)));
    return fields;
  }

  List<QueryRow> AdaptRows(Results result){
    List<QueryRow> rows = new List<QueryRow>();
    result.forEach((row) => rows.add(AdaptRow(row,result)));
    return rows;
  }

  QueryRow AdaptRow(Row row, Results result){
    Map<String, dynamic> columns = new Map();
    List<Field> fields = result.fields;

    for(int i = 0; i < fields.length; i++){
      columns[fields[i].name] = row[i];
    }

    return new QueryRow(columns);
  }

  List<String> AdaptColumns(Results result){
    List<String> _columns = new List<String>();
    result.fields.forEach((field)=> _columns.add(field.name));
    return _columns;
  }

  String GetFieldName(Field field, int splitSide){
    String name = field.name;
    List<String> splitted = name.split("#");
    if(splitted.length > 1){ return splitted[splitSide]; }
    return name;
  }
}