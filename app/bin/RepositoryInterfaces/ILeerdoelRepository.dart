import '../Models/Leerdoel.dart';
import '../Models/LesLeerdoel.dart';

abstract class ILeerdoelRepository{
  void PersistLeerdoel(Leerdoel leerdoel);
  void AddLeerdoelToLes(LesLeerdoel leerdoel);
  Future<List<Leerdoel>> GetAllModuleLeerdoelen(int moduleId);
  Future<List<Leerdoel>> GetAllUsedLeerdoelen(int moduleId);
  Future<List<Leerdoel>> GetAllLesUnusedLeerdoelen(int lesId);
  Future<List<Leerdoel>> GetAllUnusedLeerdoelen(int moduleId);
  Future<List<Leerdoel>> GetAllLesLeerdoelen(int lesId);
}