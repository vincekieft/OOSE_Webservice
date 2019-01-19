import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';

import 'Opleiding.dart';

@Table("Module")
class Module{

  @Primary("id")
  int id;

  @Column("naam")
  String naam;

  @Column("beschrijving")
  String beschrijving;

  @JSONDate()
  @Column("startdatum")
  DateTime startdatum;

  @JSONDate()
  @Column("einddatum")
  DateTime einddatum;

  @JSONObject()
  @HasOne("opleiding_id")
  Opleiding opleiding;
}