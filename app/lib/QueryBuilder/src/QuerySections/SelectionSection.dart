import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/Criteria.dart';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/Section.dart';

class SelectionSection<T extends IWritable> extends Section{
  List<Criteria> _criteria = new List<Criteria>();

  SelectionSection(QueryBuilder builder) : super(builder);

  // Public methods
  T Equal(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "=", value, table);
  }

  T NotEqual(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "!=", value, table);
  }

  T EqualColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return AddCriteriaColumn(column, "=", targetColumn, targetTable, table);
  }

  T NotEqualColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return AddCriteriaColumn(column, "!=", targetColumn, targetTable, table);
  }

  T GreaterThan(String column, dynamic value, [String table = null]){
    return AddCriteria(column, ">", value, table);
  }

  T GreaterThanColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return AddCriteriaColumn(column, ">", targetColumn, targetTable, table);
  }

  T LessThan(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "<", value, table);
  }

  T LessThanColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return AddCriteriaColumn(column, "<", targetColumn, targetTable, table);
  }

  T GreaterEqualThan(String column, dynamic value, [String table = null]){
    return AddCriteria(column, ">=", value, table);
  }

  T GreaterEqualThanColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return AddCriteriaColumn(column, ">=", targetColumn, targetTable, table);
  }

  T LessEqualThan(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "<=", value, table);
  }

  T LessEqualThanColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return AddCriteriaColumn(column, "<=", targetColumn, targetTable, table);
  }

  T Like(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "LIKE", value, table);
  }

  T LikeColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return AddCriteriaColumn(column, "LIKE", targetColumn, targetTable, table);
  }

  T NotLike(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "NOT LIKE", value, table);
  }

  T NotLikeColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return AddCriteriaColumn(column, "NOT LIKE", targetColumn, targetTable, table);
  }

  T AddCriteriaColumn(String column, String operator, String targetColumn, [String targetTable = null, String table = null]){
    String targetTableColumn = GenerateTableColumn(targetColumn,EnsureTable(targetTable));
    return AddCriteria(column, operator, targetTableColumn, table);
  }

  T AddCriteria(String column, String operator, dynamic value, [String table = null]){
    String tableColumn = GenerateTableColumn(column,EnsureTable(table));
    _criteria.add(new Criteria(tableColumn, operator, value));
    return this as T;
  }

  String EnsureTable(String table){
    return (table != null)? table : builder.RootTable;
  }

  String GenerateTableColumn(String column, String table){
    return "${table}.${column}";
  }

  // Get
  List<Criteria> get SelectionCreteria => _criteria;
}