import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';

import 'Docent.dart';
import 'Les.dart';

@Table("LesDocent")
class LesDocent{

  @Primary("id")
  int id;

  @JSONObject()
  @HasOne("les_id")
  Les les;

  @JSONObject()
  @HasOne("docent_id")
  Docent docent;

}