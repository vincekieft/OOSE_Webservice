import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/Criteria.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/Section.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';

class UpdateSection extends Section implements IWritable {

  // Private variables
  List<Criteria> _values = new List<Criteria>();

  UpdateSection(QueryBuilder builder) : super(builder);

  // Public methods
  UpdateSection AddValue(String key, dynamic value){
    _values.add(new Criteria("${builder.RootTable}.${key}", "=", value));
    return this;
  }

  // Render methods
  @override
  String toString(){
    return "UPDATE ${builder.RootTable} SET ${ArrayUtils.JoinList(_values, ",")}";
  }

  @override
  int Order() {
    return 0;
  }
}