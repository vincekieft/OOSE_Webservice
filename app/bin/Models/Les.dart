import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';
import 'Document.dart';
import 'Module.dart';

@Table("Les")
class Les{

  @Primary("id")
  int id;

  @Column("naam")
  String naam;

  @JSONDate()
  @Column("datum")
  DateTime datum;

  @JSONObject()
  @HasOne("document_id")
  Document document;

  @JSONObject()
  @HasOne("module_id")
  Module module;
}