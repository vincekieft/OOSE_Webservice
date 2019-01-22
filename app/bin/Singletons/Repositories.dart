import '../Repositories/DocentRepository.dart';
import '../Repositories/LeerdoelRepository.dart';
import '../Repositories/LesRepository.dart';
import '../Repositories/ModulesRepository.dart';
import '../Repositories/OpleidingRepository.dart';
import '../Repositories/StudentRepository.dart';
import '../RepositoryInterfaces/IDocentRepository.dart';
import '../RepositoryInterfaces/ILeerdoelRepository.dart';
import '../RepositoryInterfaces/ILesRepository.dart';
import '../RepositoryInterfaces/IModulesRepository.dart';
import '../RepositoryInterfaces/IOpleidingRepository.dart';
import '../RepositoryInterfaces/IStudentRepository.dart';

class Repositories{

  // Singleton
  static Repositories _instance;

  /**
   * Returns a global instance of Repositories
   */
  static Repositories I(){
    if(Repositories._instance == null){
      Repositories._instance = new Repositories();
    }

    return Repositories._instance;
  }

  // Private variables
  IDocentRepository _docent;
  ILeerdoelRepository _leerdoel;
  ILesRepository _les;
  IModulesRepository _modules;
  IOpleidingRepository _opleiding;
  IStudentRepository _student;

  Repositories(){
    _docent = new DocentRepository();
    _leerdoel = new LeerdoelRepository();
    _les = new LesRepository();
    _modules = new ModulesRepository();
    _opleiding = new OpleidingRepository();
    _student = new StudentRepository();
  }

  // Getters
  IDocentRepository get Docenten => _docent;
  ILeerdoelRepository get Leerdoelen => _leerdoel;
  ILesRepository get Lessen => _les;
  IModulesRepository get Modulen => _modules;
  IOpleidingRepository get Opleidingen => _opleiding;
  IStudentRepository get Studenten => _student;
}