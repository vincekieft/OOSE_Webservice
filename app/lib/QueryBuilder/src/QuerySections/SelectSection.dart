import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/Criteria.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/Section.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';

class SelectSection extends Section implements IWritable{

  // Private variables
  List<Criteria> _columns = new List<Criteria>();
  bool _ignoreFrom = false;

  SelectSection(QueryBuilder builder) : super(builder);

  // Public methods
  SelectSection SelectSingleFunction(String function, String Name){
    IgnoreFrom();
    _columns.add(new Criteria("${function}()", "AS", Name));
    return this;
  }

  SelectSection SelectAll([String table]){
    return AddCriteria("*", null, null, table);
  }

  SelectSection SetColumn(String column, [String table]){
    return SetNamedColumn(column,column);
  }

  SelectSection SetNamedColumn(String column, String Name, [String table]){
    return AddCriteria(column,"AS",Name,table);
  }

  SelectSection AddCriteria(String column, String operator, String Name, [String table]){
    table = _EnsureTable(table);
    _columns.add(new Criteria("${table}.${column}", operator, Name));
    return this;
  }

  SelectSection IgnoreFrom(){
    _ignoreFrom = true;
    return this;
  }

  SelectSection ActivateFrom(){
    _ignoreFrom = false;
    return this;
  }

  // Private methods
  String _EnsureTable(String table){
    return (table != null)? table : builder.RootTable;
  }

  // Getters
  String get Select{
    return "SELECT ${ArrayUtils.JoinWritables(_columns, ",")}";
  }

  String get From{
    if(_ignoreFrom){return null;}
    return "FROM ${builder.RootTable}";
  }

  // Render method
  @override
  String toString(){
    return ArrayUtils.JoinList([Select,From], " ");
  }

  @override
  int Order() {
    return 0;
  }
}