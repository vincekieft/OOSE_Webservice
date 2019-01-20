import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';

import '../Database/DB.dart';
import '../Models/Persoon.dart';
import '../Models/Student.dart';

class StudentRepository{

  Future<List<Student>> GetAllStudents() async{
    ORMQueryBuilder<Student> builder = DB.orm.StartQuery<Student>();
    builder.LeftJoin(Persoon).EqualColumn("persoon_id", "id");
    return await builder.Execute();
  }

  Future<List<Student>> GetAllModuleStudents(int moduleId) async{
    ORMQueryBuilder<Student> builder = DB.orm.StartQuery<Student>();
    builder.LeftJoin(Persoon).EqualColumn("persoon_id", "id");

    // Sub query
    QueryBuilder subQuery = new QueryBuilder("ModuleStudent");
    subQuery.Select().SetColumn("student_id");
    subQuery.Where().Equal("module_id", moduleId);

    builder.Where().In("id", subQuery.WriteAsSubquery());

    return await builder.Execute();
  }
}