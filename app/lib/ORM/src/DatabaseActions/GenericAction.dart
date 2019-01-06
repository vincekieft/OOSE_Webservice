import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/DatabaseActions/AAction.dart';
import 'package:OOSE/ORM/src/QueryBuilder/ORMQueryBuilder.dart';

class GenericAction<T> extends AAction<T>{

  // Private variables
  ORMQueryBuilder _builder;

  GenericAction(ORM orm, ORMQueryBuilder builder) : super(orm){
    _builder = builder;
  }

  @override
  Future<String> BuildQuery() async{
    return _builder.Write();
  }
}