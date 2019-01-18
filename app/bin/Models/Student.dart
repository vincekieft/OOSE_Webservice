import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';

import 'Persoon.dart';

@Table("Student")
class Student{

  @Primary("id")
  int id;

  @JSONObject()
  @HasOne("persoon_id")
  Persoon persoon;
}