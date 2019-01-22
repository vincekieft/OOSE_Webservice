import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/Section.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';
import 'package:OOSE/QueryBuilder/src/IWritable.dart';

class InsertSection extends Section implements IWritable {

  // Private variables
  Map<String, dynamic> _values = new Map<String,dynamic>();

  InsertSection(QueryBuilder builder) : super(builder);

  // Public methods
  /**
   * Add a column value pair to the insert statement
   */
  InsertSection AddValue(String column, dynamic value){
    _values["${builder.RootTable}.${column}"] = "'${value}'";
    return this;
  }

  // Render methods
  @override
  String toString(){
    return "INSERT INTO ${builder.RootTable} (${ArrayUtils.JoinMapKeys(_values, ",")}) VALUES (${ArrayUtils.JoinMapValues(_values, ",")})";
  }

  @override
  int Order() {
    return 0;
  }
}