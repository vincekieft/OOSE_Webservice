import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/Annotations/Association.dart';
import 'package:OOSE/ORM/src/Annotations/Column.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/AssociationAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Decorators/FieldAnnotationDecorator.dart';
import 'package:OOSE/ORM/src/Annotations/Parsers/AssociationAnnotationParser.dart';
import 'package:OOSE/ORM/src/Annotations/Parsers/ColumnAnnotationParser.dart';
import 'package:OOSE/ORM/src/Annotations/Parsers/TableAnnotationParser.dart';
import 'package:OOSE/ORM/src/Annotations/Table.dart';

class RuntimeClassReflection{

  // Private variables
  Type _instanceType;
  ORM _orm;
  int _primaryIdentifierIndex = -1;

  // Class database information
  AnnotationDecorator<Table> _table;
  List<FieldAnnotationDecorator<Column>> _columns;
  List<AssociationAnnotationDecorator<Association>> _associations;

  RuntimeClassReflection(Type type, ORM orm){
    // Init data
    _instanceType = type;
    _orm = orm;
  }

  // Initialize
  void Initialize(){
    _InitializeTable();
    _InitializeColumns();
    _InitializeAssociations();
  }
  void _InitializeTable(){
    _table = new TableAnnotationParser(_orm).FindAnnotation(_instanceType);
  }
  void _InitializeColumns(){
    _columns = new ColumnAnnotationParser(_orm).FindAnnotations(_instanceType, _table);
  }
  void _InitializeAssociations(){
    _associations = new AssociationAnnotationParser(_orm).FindAnnotations(_instanceType, _table);
  }

  // Public methods
  FieldAnnotationDecorator<Column> FindColumnByIdentifier(String identifier){
    for(FieldAnnotationDecorator<Column> column in _columns){
      if(column.Identifier == identifier){ return column; }
    }

    return null;
  }

  // Private methods
  int FindPrimaryIdentifier(){
    for(int i = 0; i < _columns.length; i++){
      if(_columns[i].IsPrimary){
        return i;
      }
    }

    return -2;
  }

  // Getters
  Type get InstanceType => _instanceType;
  AnnotationDecorator<Table> get TableAnnotation => _table;
  List<FieldAnnotationDecorator<Column>> get Columns => _columns;
  List<AssociationAnnotationDecorator<Association>> get Associations => _associations;
  FieldAnnotationDecorator<Column> get PrimaryKey {
    if(_primaryIdentifierIndex == -1){ _primaryIdentifierIndex =  FindPrimaryIdentifier(); } // First time search for primary key
    if(_primaryIdentifierIndex < 0){return null;} // Early exit since there is no primary key
    return _columns[_primaryIdentifierIndex]; // Return primary
  }
}