import '../Models/Leerdoel.dart';
import '../Models/Module.dart';

class CreateLeerdoelDTO{

  int module_id;
  String name;
  String description;

  Leerdoel ToLeerdoel(){
    Leerdoel leerdoel = new Leerdoel();
    Module module = new Module();

    leerdoel.naam = name;
    leerdoel.beschrijving = description;
    leerdoel.module = module;
    module.id = module_id;

    return leerdoel;
  }
}