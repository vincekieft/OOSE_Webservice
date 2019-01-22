import '../Models/Document.dart';
import '../Models/Les.dart';
import '../Models/Module.dart';

class CreateLesDTO{
  DateTime date;
  String content;
  int module_id;
  String name;

  Les ToLes(){
    Les les = new Les();
    Module module = new Module();
    Document document = new Document();

    module.id = module_id;
    les.datum = date;
    les.naam = name;
    document.naam = les.naam;
    document.revisie = 1;
    document.inhoud = content;
    les.document = document;
    les.module = module;

    return les;
  }
}