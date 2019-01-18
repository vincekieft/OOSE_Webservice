import 'package:OOSE/ORM/ORM.dart';

@Table("Persoon")
class Persoon{
  @Primary("id")
  int id;

  @Column("voornaam")
  String voornaam;

  @Column("achternaam")
  String achternaam;

  @Column("emailadres")
  String emailadres;
}