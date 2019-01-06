import 'package:OOSE/ORM/src/Annotations/Column.dart';
import 'package:OOSE/ORM/src/Annotations/HasOne.dart';
import 'package:OOSE/ORM/src/Annotations/Primary.dart';
import 'package:OOSE/ORM/src/Annotations/Table.dart';
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