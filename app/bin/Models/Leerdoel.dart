import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';
import 'Module.dart';

@Table("Leerdoel")
class Leerdoel{

  @Primary("id")
  int id;

  @Column("naam")
  String naam;

  @Column("beschrijving")
  String beschrijving;

  @JSONObject()
  @HasOne("module_id")
  Module module;

}