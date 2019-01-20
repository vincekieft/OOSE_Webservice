import 'package:OOSE/JSON/JSON.dart';
import 'package:OOSE/ORM/ORM.dart';

import 'Module.dart';
import 'Student.dart';

@Table("ModuleStudent")
class ModuleStudent{

  @Primary("id")
  int id;

  @JSONObject()
  @HasOne("module_id")
  Module module;

  @JSONObject()
  @HasOne("student_id")
  Student student;
}