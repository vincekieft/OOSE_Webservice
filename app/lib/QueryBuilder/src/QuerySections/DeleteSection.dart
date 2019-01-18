import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/Section.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';

class DeleteSection extends Section implements IWritable {

  DeleteSection(QueryBuilder builder) : super(builder);

  // Render methods
  @override
  String toString(){
    return "DELETE ${ArrayUtils.JoinList(builder.Tables, ",")} FROM ${builder.RootTable}";
  }

  @override
  int Order() {
    return 0;
  }
}