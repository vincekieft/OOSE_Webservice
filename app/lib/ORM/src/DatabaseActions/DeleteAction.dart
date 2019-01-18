import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'AAction.dart';

class DeleteAction<T> extends AAction<T> {

  // Private variables
  dynamic _model;

  DeleteAction(dynamic model, ORM orm) : super(orm){
    _model = model;
  }

  @override
  Future<String> BuildQuery() async{
    RuntimeClassReflection reflection = Orm.GetRuntimeReflection(_model.runtimeType);
    QueryBuilder builder = new QueryBuilder(reflection.TableAnnotation.Identifier);
    _DeleteObject(builder, _model);
    return builder.Write();
  }

  // Private methods
  void _DeleteObject(QueryBuilder builder, dynamic model){
    RuntimeClassReflection reflection = Orm.GetRuntimeReflection(model.runtimeType);
    InstanceMirror mirror = reflect(model);
    builder.Delete();
    WhereSection where = builder.Where();

    if(reflection.PrimaryKey != null){
      where.Equal(reflection.PrimaryKey.Identifier,  mirror.getField(reflection.PrimaryKey.VariableSymbol).reflectee);
      _ResolveAssociations(builder, mirror, reflection);
    }
  }

  void _DeleteRelation(QueryBuilder builder, AssociationAnnotationDecorator<Association> association, dynamic model){
    RuntimeClassReflection reflection = Orm.GetRuntimeReflection(model.runtimeType);
    InstanceMirror mirror = reflect(model);
    JoinSection join = builder.LeftJoin(reflection.TableAnnotation.Identifier);

    if(reflection.PrimaryKey != null){

      if(association.Identifiable is HasMany){
        join.EqualColumn(reflection.PrimaryKey.Identifier, association.Identifiable.Identifier);
      } else {
        join.EqualColumn(association.Identifiable.Identifier, reflection.PrimaryKey.Identifier);
      }

      _ResolveAssociations(builder, mirror, reflection);
    }
  }

  void _ResolveAssociations(QueryBuilder builder, InstanceMirror mirror, RuntimeClassReflection reflection){
    reflection.Associations.forEach((AssociationAnnotationDecorator<Association> association){
      if(association.IsComposition){
        _DeleteAssociation(builder, mirror, association);
      }
    });
  }

  void _DeleteAssociation(QueryBuilder builder, InstanceMirror mirror, AssociationAnnotationDecorator<Association> association){
    association.ForeachValue(mirror, (dynamic value){
      _DeleteRelation(builder, association, value);
    });
  }
}