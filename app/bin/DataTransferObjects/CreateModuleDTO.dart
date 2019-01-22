import '../Models/Module.dart';
import '../Models/Opleiding.dart';

class CreateModuleDTO{
  String name;
  DateTime startdate;
  DateTime enddate;
  String description;
  int education_id;

  // Public methods
  Module ToModule(){
    Module module = new Module();
    Opleiding education = new Opleiding();

    module.naam = name;
    module.startdatum = startdate;
    module.einddatum = enddate;
    module.beschrijving = description;
    module.opleiding = education;
    education.id = education_id;

    return module;
  }
}