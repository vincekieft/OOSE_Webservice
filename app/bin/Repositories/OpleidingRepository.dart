import 'package:OOSE/ORM/ORM.dart';
import '../Database/DB.dart';
import '../Models/Opleiding.dart';
import '../RepositoryInterfaces/IOpleidingRepository.dart';

class OpleidingRepository implements IOpleidingRepository{

  @override
  Future<List<Opleiding>> GetAllOpleidingen() async{
    ORMQueryBuilder<Opleiding> builder = DB.orm.StartQuery<Opleiding>();
    return await builder.Execute();
  }

  @override
  void PersistOpleiding(Opleiding opleiding) {
    DB.orm.Persist<Opleiding>(opleiding);
  }

  @override
  Future<Opleiding> GetOpleidingById(int id) async{
    ORMQueryBuilder<Opleiding> builder = DB.orm.StartQuery<Opleiding>();
    builder.Where().Equal("id", id);
    return await builder.ExecuteSingle();
  }
}