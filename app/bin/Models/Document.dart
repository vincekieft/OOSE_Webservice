import 'package:OOSE/ORM/ORM.dart';

@Table("Document")
class Document{

  @Primary("id")
  int id;

  @Column("naam")
  String naam;

  @Column("revisie")
  int revisie;

  @Column("inhoud")
  String inhoud;

}