import '../Models/Les.dart';

abstract class ILesRepository{
  void PersistLes(Les les);
  Future<Les> GetLesById(int id);
  Future<List<Les>> GetAllModuleLessen(int module);
}