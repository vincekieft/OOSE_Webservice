import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';

import 'Leerdoel.dart';
import 'Les.dart';

@Table("LesLeerdoel")
class LesLeerdoel{

  @Primary("id")
  int id;

  @JSONObject()
  @HasOne("les_id")
  Les les;

  @JSONObject()
  @HasOne("leerdoel_id")
  Leerdoel leerdoel;
}