import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';
import 'Ding.dart';

@Table("User")
class User{

  @Primary("id")
  int id;

  @Column("name")
  String name;

  @Column("tel")
  int tel;

  @JSONIgnore()
  @HasMany("user_id")
  List<Ding> dingen;
}