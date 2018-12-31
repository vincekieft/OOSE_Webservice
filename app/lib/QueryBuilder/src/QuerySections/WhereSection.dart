import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/SelectionSection.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';

class WhereSection extends SelectionSection<WhereSection> implements IWritable{

  WhereSection(QueryBuilder builder) : super(builder);

  // Render method
  @override
  String toString() {
    return "WHERE ${ArrayUtils.JoinWritables(SelectionCreteria, " AND ")}";
  }

  @override
  int Order() {
    return 100;
  }
}