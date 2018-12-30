import 'package:OOSE/QueryBuilder/QueryBuilder.dart';

abstract class Section{

  // Private variables
  QueryBuilder _builder = null;

  Section(QueryBuilder builder){
    _builder = builder;
  }

  // Get / Set
  QueryBuilder get builder{
    return _builder;
  }
}