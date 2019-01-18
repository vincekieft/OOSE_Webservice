import 'package:OOSE/ORM/ORM.dart';

import '../Database/DB.dart';
import '../Models/Persoon.dart';
import '../Models/Student.dart';

class StudentRepository{

  Future<List<Student>> GetAllStudents() async{
    ORMQueryBuilder<Student> builder = DB.orm.StartQuery<Student>();
    builder.LeftJoin(Persoon).EqualColumn("persoon_id", "id");
    return await builder.Execute();
  }
}