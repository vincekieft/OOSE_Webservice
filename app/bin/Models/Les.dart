import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';
import 'Module.dart';

@Table("Les")
class Les{

  @Primary("id")
  int id;

  @JSONDate()
  @Column("datum")
  DateTime datum;

  @Column("lesstof")
  String lesstof;

  @JSONObject()
  @HasOne("module_id")
  Module module;
}