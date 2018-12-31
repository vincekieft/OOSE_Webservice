class User{
  int _id;
  String _name;
  int _tel;

  User(String name, int tel){
    _name = name;
    _tel = tel;
  }

  // Getters
  int get id => _id;
  String get name => _name;
  int get tel => _tel;
}