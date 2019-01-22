import '../Models/Docent.dart';
import '../Models/Les.dart';
import '../Models/LesDocent.dart';

class CreateLesDocentDTO{

  int teacher_id;

  LesDocent ToLesDocent(int lesId){
    LesDocent lesDocent = new LesDocent();
    Docent docent = new Docent();
    Les les = new Les();

    les.id = lesId;
    docent.id = teacher_id;
    lesDocent.docent = docent;
    lesDocent.les = les;

    return lesDocent;
  }
}