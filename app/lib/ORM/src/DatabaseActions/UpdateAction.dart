import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/FieldAnnotationDecorator.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/UpdateSection.dart';
import 'AAction.dart';

class UpdateAction<T> extends AAction<T> {

  // Private variables
  dynamic _model;

  UpdateAction(dynamic model, ORM orm) : super(orm) {
    _model = model;
  }

  @override
  Future<String> BuildQuery() async{
    RuntimeClassReflection reflection = Orm.GetRuntimeReflection(_model.runtimeType);
    QueryBuilder builder = new QueryBuilder(reflection.TableAnnotation.Identifier);
    _UpdateModel(builder, _model);
    return builder.Write();
  }

  // Private methods
  void _UpdateModel(QueryBuilder builder,dynamic model){
    RuntimeClassReflection reflection = Orm.GetRuntimeReflection(model.runtimeType);
    InstanceMirror mirror = reflect(model);
    WhereSection where = builder.Where();

    if(reflection.PrimaryKey != null){
      where.Equal(reflection.PrimaryKey.Identifier,  mirror.getField(reflection.PrimaryKey.VariableSymbol).reflectee);
      _SetUpdateValues(builder.Update(), reflection, mirror);
    }
  }

  void _SetUpdateValues(UpdateSection update, RuntimeClassReflection reflection,InstanceMirror mirror){
    reflection.Columns.forEach((FieldAnnotationDecorator<Column> column){
      if(!column.IsPrimary) {
        update.AddValue(column.Identifier, mirror
            .getField(column.VariableSymbol)
            .reflectee);
      }
    });
  }
}