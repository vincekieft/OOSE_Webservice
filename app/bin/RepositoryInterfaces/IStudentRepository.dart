import '../Models/ModuleStudent.dart';
import '../Models/Student.dart';

abstract class IStudentRepository{
  void PersistStudent(Student student);
  void AddStudentToModule(ModuleStudent student);
  Future<List<Student>> GetAllStudents();
  Future<List<Student>> GetAllModuleStudents(int moduleId);
  Future<List<Student>> GetAllUnusedModuleStudents(int moduleId);
}