class ColumnConstraint{
  String _ColumnName;
  String _ConstraintName;
  String _ReferencedColumnName;
  String _ReferencedTableName;

  // Getters
  String get ColumnName => _ColumnName;
  String get ConstraintName => _ConstraintName;
  String get ReferencedColumnName => _ReferencedColumnName;
  String get ReferencedTableName => _ReferencedTableName;

  // Setters
  void set ColumnName(String name){
    _ColumnName = name;
  }
  void set ConstraintName(String name){
    _ConstraintName = name;
  }
  void set ReferencedColumnName(String name){
    _ReferencedColumnName = name;
  }
  void set ReferencedTableName(String name){
    _ReferencedTableName = name;
  }
}