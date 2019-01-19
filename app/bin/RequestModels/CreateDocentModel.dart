import '../Models/Docent.dart';
import '../Models/Persoon.dart';

class CreateDocentModel{

  String firstname;
  String lastname;
  String email;

  // Public methods
  Docent ToDocent(){
    Docent docent = new Docent();
    Persoon person = new Persoon();
    docent.persoon = person;
    person.achternaam = lastname;
    person.emailadres = email;
    person.voornaam = firstname;
    return docent;
  }
}