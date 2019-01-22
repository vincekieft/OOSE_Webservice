import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import '../Database/DB.dart';
import '../Models/ModuleStudent.dart';
import '../Models/Persoon.dart';
import '../Models/Student.dart';
import '../RepositoryInterfaces/IStudentRepository.dart';

class StudentRepository implements IStudentRepository{

  @override
  Future<List<Student>> GetAllStudents() async{
    ORMQueryBuilder<Student> builder = DB.orm.StartQuery<Student>();
    builder.LeftJoin(Persoon).EqualColumn("persoon_id", "id");
    return await builder.Execute();
  }

  @override
  Future<List<Student>> GetAllModuleStudents(int moduleId) async{
    ORMQueryBuilder<Student> builder = DB.orm.StartQuery<Student>();
    builder.LeftJoin(Persoon).EqualColumn("persoon_id", "id");
    builder.Where().In("id", _SelectModuleStudentsQuery(moduleId).WriteAsSubquery());
    return await builder.Execute();
  }

  @override
  Future<List<Student>> GetAllUnusedModuleStudents(int moduleId) async{
    ORMQueryBuilder<Student> builder = DB.orm.StartQuery<Student>();
    builder.LeftJoin(Persoon).EqualColumn("persoon_id", "id");
    builder.Where().NotIn("id", _SelectModuleStudentsQuery(moduleId).WriteAsSubquery());
    return await builder.Execute();
  }

  @override
  void PersistStudent(Student student) {
    DB.orm.Persist<Student>(student);
  }

  @override
  void AddStudentToModule(ModuleStudent student) {
    DB.orm.Persist<ModuleStudent>(student);
  }

  // Private methods

  QueryBuilder _SelectModuleStudentsQuery(int moduleId){
    QueryBuilder subQuery = new QueryBuilder("ModuleStudent");
    subQuery.Select().SetColumn("student_id");
    subQuery.Where().Equal("module_id", moduleId);
    return subQuery;
  }
}