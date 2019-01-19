import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/Annotations/Column.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/FieldAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Result/QueryResult.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'AAction.dart';

class InsertAction<T> extends AAction<T>{

  // Private variables
  dynamic _model;
  RuntimeClassReflection _reflection;
  InstanceMirror _mirror;

  InsertAction(dynamic model, ORM orm) : super(orm){
    _model = model;
    _reflection = Orm.GetRuntimeReflection(model.runtimeType);
    _mirror = reflect(model);
  }

  @override
  Future<String> BuildQuery() async {
    QueryBuilder builder = new QueryBuilder(_reflection.TableAnnotation.Identifier);
    InsertSection insert = builder.Insert();

    _AddColumnsToBuilder(insert);
    await _ResolveAssociations(insert);

    return builder.Write();
  }

  // Private methods
  void _AddColumnsToBuilder(InsertSection insert){
    _reflection.Columns.forEach((FieldAnnotationDecorator<Column> column){
      dynamic value = _GetVariable(column.VariableName);
      if(value != null){
        insert.AddValue(column.Identifier, value);
      }
    });
  }

  void _ResolveAssociations(InsertSection insert) async{
    for(AssociationAnnotationDecorator<Association> association in _reflection.Associations){
      if(!association.Identifiable.IsVirtualAttribute){
        dynamic value = _GetVariable(association.VariableName);
        if(value != null) {
          QueryResult result = await new InsertAction(value, Orm).CallResult();
          insert.AddValue(association.Identifier, result.InsertId);
        }
      }
    }
  }

  dynamic _GetVariable(String name){
    return _mirror.getField(new Symbol(name)).reflectee;
  }

  Future<QueryResult> _ExecuteWithPrimaryIdentifier(FieldAnnotationDecorator<Column> primary, String query) async{
    dynamic id = _GetVariable(primary.VariableName);

    if(id == null){
      QueryResult result = await super.ExecuteQuery(query);
      _mirror.setField(new Symbol(primary.Identifier), result.InsertId);
      return result;
    } else {
      return _CreateFakeResult(id);
    }
  }

  QueryResult _CreateFakeResult(int id){
    QueryResult result = new QueryResult();
    result.SetInsertedID(id);
    return result;
  }

  // Overrides
  @override
  Future<QueryResult> CallResult() async{
    // Always build query
    String query = await BuildQuery();

    PrintQuery(query);

    // Check primary key
    FieldAnnotationDecorator<Column> primary = _reflection.PrimaryKey;
    if(primary != null){ return await _ExecuteWithPrimaryIdentifier(primary, query); } // Execute when there is a primary key

    // Return normal query result when there is no primary key
    return await super.ExecuteQuery(query);
  }

  @override
  Future<List<T>> Call() async{
    await CallResult();
    return new List<T>.from([_model]);
  }
}