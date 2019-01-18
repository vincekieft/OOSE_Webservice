import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';
import 'User.dart';

@Table("Ding")
class Ding{

  @Primary("id")
  int id;

  @Column("ding")
  String ding;

  @Column("user_id")
  int user_id;

  @JSONObject()
  @HasOne("user_id", true)
  User user;
}