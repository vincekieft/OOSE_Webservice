import '../Models/Module.dart';
import '../Models/ModuleStudent.dart';
import '../Models/Student.dart';

class CreateModuleStudentDTO{

  int student_id;

  ModuleStudent ToModuleStudent(int moduleId){
    ModuleStudent moduleStudent = new ModuleStudent();
    Module module = new Module();
    Student student = new Student();

    module.id = moduleId;
    student.id = student_id;
    moduleStudent.student = student;
    moduleStudent.module = module;

    return moduleStudent;
  }
}