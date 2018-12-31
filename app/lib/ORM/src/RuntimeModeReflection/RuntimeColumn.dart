import 'package:OOSE/ORM/src/RuntimeModeReflection/ColumnConstraint.dart';

class RuntimeColumn{

  // Private variables
  ColumnConstraint _constraint = null;
  String _column;
  Type _runtimeType;

  RuntimeColumn(String column, Type runtimeType, [ColumnConstraint constraint]){
    _column = column;
    _runtimeType = runtimeType;
    _constraint = constraint;
  }

  // Getters
  Type get RuntimeType => _runtimeType;
  String get Column => _column;
  ColumnConstraint get Constraint => _constraint;
  bool get IsAssociation{
    if(_constraint == null){return false;} // Early exit
    return _constraint.ReferencedTableName != null;
  }
  bool get IsPrimary{
    if(_constraint == null){return false;} // Early exit
    return _constraint.ConstraintName == "PRIMARY";
  }
}