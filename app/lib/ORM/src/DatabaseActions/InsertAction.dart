import 'dart:mirrors';

import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'AAction.dart';

class InsertAction extends AAction{

  InsertAction(ORM orm) : super(orm);

  /*
  Future<int> Call(dynamic model) async {
    RuntimeTypeReflection reflection = await Orm.GetRuntimeReflection(ModelType);
    QueryBuilder builder = new QueryBuilder(ModelType.toString());
    InstanceMirror instanceMirror = reflect(model);

    for (RuntimeColumn column in reflection.Columns) {
      await AddColumnToBuilder(builder, column, instanceMirror);
    }

    dynamic result = await Orm.ExecuteQueryResult(builder.Write());
    return (result != null)? result.InsertId : -1;
  }
  */

  /*
  void AddColumnToBuilder(QueryBuilder builder, RuntimeColumn column, InstanceMirror instanceMirror) async{
    String columnName = column.Column;
    String valueColumnName = _FormatVariableNameToGetter(column.Variable);
    dynamic overrideValue = null;

    if(column.IsPrimary || column.IsAssociation){ columnName = column.Constraint.ColumnName; } // Set column name to constraint column

    if(column.IsAssociation){
      dynamic association = instanceMirror.getField(new Symbol(valueColumnName)).reflectee;
      //overrideValue = await new InsertAction(column.RuntimeType, Orm).Call(association);
      valueColumnName = null;
    }

    InsertValueToBuilder(builder, columnName, valueColumnName, instanceMirror, overrideValue);
  }
  */

  void InsertValueToBuilder(QueryBuilder builder, String column, String valueColumn, InstanceMirror instanceMirror, [dynamic overrideValue]){
    if(instanceMirror.reflectee != null) {
      dynamic value = (valueColumn != null) ? instanceMirror
          .getField(new Symbol(valueColumn))
          .reflectee : overrideValue;

      if (value != null) { // Only insert if not null
        InsertSection insert = builder.Insert();
        insert.AddValue(column, value);
      }
    }
  }

  String _FormatVariableNameToGetter(String variable){
    //return variable.substring(RuntimeTypeReflection.VARIABLE_IDENTIFIER.length,variable.length);
  }

  @override
  String BuildQuery() {
    // TODO: implement BuildQuery
    return null;
  }
}