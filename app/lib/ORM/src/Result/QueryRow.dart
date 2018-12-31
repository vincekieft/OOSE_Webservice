class QueryRow{

  // Private variables
  Map<String, dynamic> _values;

  QueryRow(Map<String, dynamic> values){
    _values = values;
  }

  // Getters
  Map<String, dynamic> get values => _values;
}