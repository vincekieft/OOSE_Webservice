import 'package:OOSE/ORM/src/Result/QueryResult.dart';
import 'package:OOSE/ORM/src/Result/QueryRow.dart';
import 'package:sqljocky5/sqljocky.dart';

class SqlJockyAdapter extends QueryResult{

  SqlJockyAdapter(Results result){
    SetRows(AdaptRows(result), result.insertId);
  }

  // Public methods
  List<QueryRow> AdaptRows(Results result){
    List<QueryRow> rows = new List<QueryRow>();
    result.forEach((row) => rows.add(AdaptRow(row,result)));
    return rows;
  }

  QueryRow AdaptRow(Row row, Results result){
    Map<String, dynamic> columns = new Map();
    List<Field> fields = result.fields;

    row.forEach((column) =>
    columns[fields[row.indexOf(column)].name] = column
    );

    return new QueryRow(columns);
  }

  List<String> AdaptColumns(Results result){
    List<String> _columns = new List<String>();
    result.fields.forEach((field)=> _columns.add(field.name));
    return _columns;
  }
}