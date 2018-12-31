import 'User.dart';

class Ding{
  int _id = 0;
  String _ding;
  User _user;

  Ding(String ding, User user){
    _ding = ding;
    _user = user;
  }

  // Getters
  int get id => _id;
  String get ding => _ding;
  User get user => _user;
}