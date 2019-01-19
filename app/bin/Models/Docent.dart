import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';

import 'Persoon.dart';

@Table("Docent")
class Docent{

  @Primary("id")
  int id;

  @JSONObject()
  @HasOne("persoon_id")
  Persoon persoon;
}