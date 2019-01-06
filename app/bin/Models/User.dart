import 'package:OOSE/ORM/src/Annotations/HasMany.dart';
import 'Ding.dart';
import 'package:OOSE/ORM/src/Annotations/Column.dart';
import 'package:OOSE/ORM/src/Annotations/Primary.dart';
import 'package:OOSE/ORM/src/Annotations/Table.dart';

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
}