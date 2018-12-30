import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/Criteria.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/Section.dart';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';

class WhereSection extends Section implements IWritable{

  List<Criteria> _criteria = new List<Criteria>();

  WhereSection(QueryBuilder builder) : super(builder);

  // Public methods
  WhereSection Equal(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "=", value, table);
  }

  WhereSection GreaterThan(String column, dynamic value, [String table = null]){
    return AddCriteria(column, ">", value, table);
  }

  WhereSection LessThan(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "<", value, table);
  }

  WhereSection GreaterEqualThan(String column, dynamic value, [String table = null]){
    return AddCriteria(column, ">=", value, table);
  }

  WhereSection LessEqualThan(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "<=", value, table);
  }

  WhereSection Like(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "LIKE", value, table);
  }

  WhereSection NotLike(String column, dynamic value, [String table = null]){
    return AddCriteria(column, "NOT LIKE", value, table);
  }

  WhereSection AddCriteria(String column, String operator, dynamic value, [String table = null]){
    String tableColumn = GenerateTableColumn(column,(table != null)? table : builder.RootTable);
    _criteria.add(new Criteria(tableColumn, operator, value.toString()));
    return this;
  }

  String GenerateTableColumn(String column, String table){
    return "${table}.${column}";
  }

  // Render method
  @override
  String toString() {
    return "WHERE ${ArrayUtils.JoinWritables(_criteria, " AND ")}";
  }

  @override
  int Order() {
    return 100;
  }
}