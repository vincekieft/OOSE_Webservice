import 'package:OOSE/ORM/ORM.dart';
import 'User.dart';

@Table("Ding")
class Ding{

  @Primary("id")
  int id;

  @Column("ding")
  String ding;

  @HasOne("user_id")
  User user;
}