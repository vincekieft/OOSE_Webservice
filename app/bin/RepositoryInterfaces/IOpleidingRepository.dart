import '../Models/Opleiding.dart';

abstract class IOpleidingRepository{
  void PersistOpleiding(Opleiding opleiding);
  Future<List<Opleiding>> GetAllOpleidingen();
  Future<Opleiding> GetOpleidingById(int id);
}