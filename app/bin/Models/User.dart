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

  @HasMany("user_id")
  List<Ding> dingen;

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'email': tel,
      };
}