import '../Models/Docent.dart';
import '../Models/LesDocent.dart';

abstract class IDocentRepository{
  void PersistDocent(Docent docent);
  void AddDocentToLes(LesDocent docent);
  Future<List<Docent>> GetAllDocenten();
  Future<List<Docent>> GetAllLesDocenten(int lesId);
  Future<List<Docent>> GetAllUnusedLesDocenten(int lesId);
}