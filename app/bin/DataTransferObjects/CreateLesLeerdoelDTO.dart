import '../Models/Leerdoel.dart';
import '../Models/Les.dart';
import '../Models/LesLeerdoel.dart';

class CreateLesLeerdoelDTO{
  int goal_id;

  LesLeerdoel ToLesLeerdoel(int lesId){
    LesLeerdoel lesLeerdoel = new LesLeerdoel();
    Leerdoel leerdoel = new Leerdoel();
    Les les = new Les();

    lesLeerdoel.les = les;
    lesLeerdoel.leerdoel = leerdoel;
    leerdoel.id = goal_id;
    les.id = lesId;

    return lesLeerdoel;
  }
}