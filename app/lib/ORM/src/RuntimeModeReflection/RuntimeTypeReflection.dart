import 'dart:mirrors';
import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/ORM/src/RuntimeModeReflection/ColumnConstraint.dart';
import 'package:OOSE/ORM/src/RuntimeModeReflection/RuntimeColumn.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';

class RuntimeTypeReflection{

  // Private variables
  InstanceMirror _mirror;
  ORM _orm;
  List<RuntimeColumn> _columns;
  dynamic _object;
  Map<String, DeclarationMirror> _declarations;
  Type _instanceType;


  RuntimeTypeReflection(dynamic object, ORM orm){
    // Init data
    _mirror = reflect(object);
    _orm = orm;
    _object = object;
    _instanceType = object.runtimeType;
  }

  // Public methods

  void InitializeInformation() async{
    _declarations = _FindDeclarations();
    _columns = await _FindRuntimeColumns();
  }

  // Private methods

  Future<List<RuntimeColumn>> _FindRuntimeColumns() async{
      List<RuntimeColumn> columns = new List<RuntimeColumn>();
      List<String> columnNames = _FindTableColumns();
      Map<String,ColumnConstraint> constraints = await _FindTableConstraints(_object.runtimeType.toString());

      // Initialize columns with basic constraints
      for(String column in columnNames){
        columns.add(new RuntimeColumn(
            column,
            _FindColumnType(column),
            _FindColumnConstraint(column, constraints)
        ));
      }

      return columns;
  }

  Type _FindColumnType(String column){
    return _mirror.getField(new Symbol(column)).reflectee.runtimeType;
  }

  ColumnConstraint _FindColumnConstraint(String column, Map<String,ColumnConstraint> constraints){
      if(constraints.containsKey(column)){return constraints[column];} // Early exit when column is in constraints keys
      if(constraints.containsKey("${column}_id")){return constraints["${column}_id"];} // Is foreign key
      return null; // No constraint found
  }

  Map<String, DeclarationMirror> _FindDeclarations(){
    Map<Symbol, DeclarationMirror> declarations = _mirror.type.declarations;
    Map<String, DeclarationMirror> keyDeclarations = new Map();

    for (DeclarationMirror v in declarations.values) {
      keyDeclarations[MirrorSystem.getName(v.simpleName)] = v;
    }

    return keyDeclarations;
  }

  List<String> _FindTableColumns(){
    List<String> columns = new List<String>();

    for(String key in _declarations.keys){
      if(_declarations.containsKey("_${key}")){
        columns.add(key);
      }
    }

    return columns;
  }

  Future<Map<String,ColumnConstraint>> _FindTableConstraints(String table) async{
    QueryBuilder builder = new QueryBuilder("information_schema.KEY_COLUMN_USAGE");

    // Select
    builder.Select().
    SetNamedColumn("COLUMN_NAME", "ColumnName").
    SetNamedColumn("CONSTRAINT_NAME", "ConstraintName").
    SetNamedColumn("REFERENCED_COLUMN_NAME", "ReferencedColumnName").
    SetNamedColumn("REFERENCED_TABLE_NAME", "ReferencedTableName");

    // Where
    builder.Where().Equal("TABLE_NAME ", table);

    // Execute
    List<ColumnConstraint> constraints = await _orm.Execute<ColumnConstraint>(builder.Write());

    return new Map<String, ColumnConstraint>.fromIterable(constraints,
        key: (item) => item.ColumnName,
        value: (item) => item);
  }

  // Getters
  Type get InstanceType => _instanceType;
  List<RuntimeColumn> get Columns => _columns;
}