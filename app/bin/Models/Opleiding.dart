import 'package:OOSE/ORM/ORM.dart';

@Table("Opleiding")
class Opleiding{

  @Primary("id")
  int id;

  @Column("naam")
  String naam;

  @Column("startjaar")
  int startjaar;
}