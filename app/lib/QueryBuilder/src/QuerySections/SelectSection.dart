import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/Criteria.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/Section.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';

class SelectSection extends Section implements IWritable{

  // Private variables
  List<Criteria> _columns = new List<Criteria>();

  SelectSection(QueryBuilder builder) : super(builder);

  // Public methods
  SelectSection SetColumn(String column){
    return SetNamedColumn(column,column);
  }

  SelectSection SetNamedColumn(String column, String Name){
    _columns.add(new Criteria("${builder.RootTable}.${column}", "AS", Name));
    return this;
  }

  // Getters
  String get Columns{
    return ArrayUtils.JoinWritables(_columns, ",");
  }

  // Render method
  @override
  String toString(){
    return "SELECT ${Columns} FROM ${builder.RootTable}";
  }

  @override
  int Order() {
    return 0;
  }
}