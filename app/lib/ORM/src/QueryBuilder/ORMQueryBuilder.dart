import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/Annotations/Column.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/FieldAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/HasOne.dart';
import 'package:OOSE/ORM/src/DatabaseActions/GenericAction.dart';
import 'package:OOSE/ORM/src/QueryBuilder/ORMSelectSection.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';

class ORMQueryBuilder<T>{

  // Private variables
  ORM _orm;
  QueryBuilder _builder;

  ORMQueryBuilder(ORM orm){
    _orm = orm;
    _InitializeBuilder();
  }

  // Public methods
  WhereSection Where(){
    return _builder.Where();
  }

  JoinSection LeftJoin(Type type){
    _SelectAllColumnsOfType(type);
    RuntimeClassReflection reflection = _orm.GetRuntimeReflection(type);
    return _builder.LeftJoin(reflection.TableAnnotation.Identifier);
  }

  JoinSection RightJoin(Type type){
    _SelectAllColumnsOfType(type);
    RuntimeClassReflection reflection = _orm.GetRuntimeReflection(type);
    return _builder.RightJoin(reflection.TableAnnotation.Identifier);
  }

  JoinSection InnerJoin(Type type){
    _SelectAllColumnsOfType(type);
    RuntimeClassReflection reflection = _orm.GetRuntimeReflection(type);
    return _builder.InnerJoin(reflection.TableAnnotation.Identifier);
  }

  JoinSection OuterJoin(Type type){
    _SelectAllColumnsOfType(type);
    RuntimeClassReflection reflection = _orm.GetRuntimeReflection(type);
    return _builder.OuterJoin(reflection.TableAnnotation.Identifier);
  }

  String Write(){
    return _builder.Write();
  }

  Future<List<T>> Execute() async{
    print(_builder.Write());
    return await new GenericAction<T>(_orm, this).Call();
  }

  Future<T> ExecuteSingle() async{
    List<T> results = await Execute();
    if(results.length > 0){return results.first;}
    return null;
  }

  // Private methods
  void _InitializeBuilder(){
    RuntimeClassReflection reflection = _orm.GetRuntimeReflection(T);
    _builder = new QueryBuilder(reflection.TableAnnotation.Identifier);
    _SelectAllColumnsOfType(T);
  }

  void _SelectAllColumnsOfType(Type type){
    RuntimeClassReflection reflection = _orm.GetRuntimeReflection(type);
    reflection.Columns.forEach((FieldAnnotationDecorator<Column> column){
      _builder.Select().SetNamedColumn(column.Identifier, _FormatColumn(reflection, column.Identifier), reflection.TableAnnotation.Identifier);
    });

    reflection.Associations.forEach((AssociationAnnotationDecorator<Association> association){
      if(!association.Identifiable.IsVirtualAttribute){
        _builder.Select().SetNamedColumn(association.Identifier, _FormatColumn(reflection, association.Identifier), reflection.TableAnnotation.Identifier);
      }
    });
  }

  String _FormatColumn(RuntimeClassReflection reflection, String column){
    return "${reflection.TableAnnotation.Identifier}#${column}";
  }
}