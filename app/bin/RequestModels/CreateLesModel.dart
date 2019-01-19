import '../Models/Les.dart';
import '../Models/Module.dart';

class CreateLesModel{
  DateTime date;
  String content;
  int module_id;
  String name;

  Les ToLes(){
    Les les = new Les();
    Module module = new Module();

    module.id = module_id;
    les.datum = date;
    les.naam = name;
    les.lesstof = content;
    les.module = module;

    return les;
  }
}