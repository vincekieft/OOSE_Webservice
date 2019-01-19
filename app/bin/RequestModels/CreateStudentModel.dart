import '../Models/Persoon.dart';
import '../Models/Student.dart';

class CreateStudentModel{
  String firstname;
  String lastname;
  String email;

  // Public methods
  Student ToStudent(){
    Student student = new Student();
    Persoon person = new Persoon();
    student.persoon = person;
    person.achternaam = lastname;
    person.emailadres = email;
    person.voornaam = firstname;
    return student;
  }
}