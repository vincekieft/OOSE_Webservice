import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Result/QueryResult.dart';
import 'package:OOSE/ORM/src/RuntimeModeReflection/RuntimeColumn.dart';
import 'package:OOSE/ORM/src/RuntimeModeReflection/RuntimeTypeReflection.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'AAction.dart';

class InsertAction extends AAction{

  InsertAction(model, ORM orm) : super(model, orm);


  Future<int> Call() async {
    RuntimeTypeReflection reflection = new RuntimeTypeReflection(Model, Orm);
    QueryBuilder builder = new QueryBuilder(Model.runtimeType.toString());
    await reflection.InitializeInformation();

    for (RuntimeColumn column in reflection.Columns) {
      await AddInsertValue(builder, column);
    }

    return (await Orm.ExecuteQueryResult(builder.Write())).InsertId;
  }

  void AddInsertValue(QueryBuilder builder, RuntimeColumn column) async{
    InsertSection insert = builder.Insert();

    if(column.IsPrimary){
      //continue;
      insert.AddValue(column.Constraint.ColumnName, this.Mirror.getField(new Symbol(column.Column)));
    } // Skip column since its primary (NOTE: assumes primaries are auto incremented. Might need to change this)

    if(column.IsAssociation){
      int id = await new InsertAction(this.Mirror.getField(new Symbol(column.Column)).reflectee, Orm).Call();
      insert.AddValue(column.Constraint.ColumnName, id);
    } else {
      insert.AddValue(column.Column, this.Mirror
          .getField(new Symbol(column.Column))
          .reflectee);
    }
  }

  String SelectLastQuery(RuntimeTypeReflection reflection){
    QueryBuilder selectLastBuilder = new QueryBuilder("");
    selectLastBuilder.Select().SelectSingleFunction("LAST_INSERT_ID", "LastID");
    
    QueryBuilder selectModelBuilder = new QueryBuilder(reflection.InstanceType.toString());
    SelectSection select = selectModelBuilder.Select();
    WhereSection where = selectModelBuilder.Where();

    for (RuntimeColumn value in reflection.Columns) {
      if(value.IsPrimary){
        where.Equal(value.Column, selectLastBuilder.WriteAsSubquery());
      }

      if(value.IsAssociation){
        select.SetColumn(value.Constraint.ColumnName);
      } else {
        select.SetColumn(value.Column);
      }
    }

    return selectModelBuilder.Write();
  }
}