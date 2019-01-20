import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/SelectionSection.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';

class JoinSection extends SelectionSection<JoinSection> implements IWritable {

  // Private variables
  String _joinType;
  int _tableIndex;

  JoinSection(String joinType, int tableIndex,QueryBuilder builder) : super(builder){
    _joinType = joinType;
    _tableIndex = tableIndex;
  }

  // Public methods
  @override
  JoinSection EqualColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return super.EqualColumn(column, targetColumn, builder.GetTable(_tableIndex), table);
  }

  @override
  JoinSection GreaterThanColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return super.GreaterThanColumn(column, targetColumn, builder.GetTable(_tableIndex), table);
  }

  @override
  JoinSection LessThanColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return super.LessThanColumn(column, targetColumn, builder.GetTable(_tableIndex), table);
  }

  @override
  JoinSection GreaterEqualThanColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return super.GreaterEqualThanColumn(column, targetColumn, builder.GetTable(_tableIndex), table);
  }

  @override
  JoinSection LessEqualThanColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return super.LessEqualThanColumn(column, targetColumn, builder.GetTable(_tableIndex), table);
  }

  @override
  JoinSection LikeColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return super.LikeColumn(column, targetColumn, builder.GetTable(_tableIndex), table);
  }

  @override
  JoinSection NotLikeColumn(String column, String targetColumn, [String targetTable = null, String table = null]){
    return super.NotLikeColumn(column, targetColumn, builder.GetTable(_tableIndex), table);
  }

  // Render method
  @override
  String toString() {
    return "${_joinType} ${builder.GetTable(_tableIndex)} ON ${ArrayUtils.JoinWritables(SelectionCreteria, " AND ")}";
  }

  @override
  int Order() {
    return 50;
  }
}