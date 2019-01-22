import '../Models/Module.dart';

abstract class IModulesRepository{
  void PersistModule(Module module);
  Future<Module> GetModuleById(int id);
  Future<List<Module>> GetAllModules();
  Future<List<Module>> GetAllEducationModules(int educationId);
}