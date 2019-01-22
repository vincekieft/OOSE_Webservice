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

  /**
   * Select a single sql function
   */
  SelectSection SelectSingleFunction(String function, String Name){
    _IgnoreFrom();
    _columns.add(new Criteria("${function}()", "AS", Name));
    return this;
  }

  /**
   * Select all columns from a table
   */
  SelectSection SelectAll([String table]){
    return AddCriteria("*", null, null, table);
  }

  /**
   * Add a column select to the select section
   */
  SelectSection SetColumn(String column, [String table]){
    return SetNamedColumn(column,column, table);
  }

  /**
   * Add a column select to the select section with a given alias
   */
  SelectSection SetNamedColumn(String column, String Name, [String table]){
    return AddCriteria(column,"AS",Name,table);
  }

  /**
   * Add selection criteria to the select section
   */
  SelectSection AddCriteria(String column, String operator, String Name, [String table]){
    table = _EnsureTable(table);
    _columns.add(new Criteria("${table}.${column}", operator, Name));
    return this;
  }

  // Private methods
  SelectSection _ActivateFrom(){
    _ignoreFrom = false;
    return this;
  }

  SelectSection _IgnoreFrom(){
    _ignoreFrom = true;
    return this;
  }

  String _EnsureTable(String table){
    return (table != null)? table : builder.RootTable;
  }

  // Getters
  String get _Select{
    return "SELECT ${ArrayUtils.JoinWritables(_columns, ",")}";
  }

  String get _From{
    if(_ignoreFrom){return null;}
    return "FROM ${builder.RootTable}";
  }

  // Render method
  @override
  String toString(){
    return ArrayUtils.JoinList([_Select,_From], " ");
  }

  @override
  int Order() {
    return 0;
  }
}