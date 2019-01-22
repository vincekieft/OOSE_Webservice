import 'package:OOSE/ORM/src/QueryBuilder/ORMQueryBuilder.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import '../Database/DB.dart';
import '../Models/Leerdoel.dart';
import '../Models/LesLeerdoel.dart';
import '../Models/Module.dart';
import '../RepositoryInterfaces/ILeerdoelRepository.dart';

class LeerdoelRepository implements ILeerdoelRepository{

  @override
  Future<List<Leerdoel>> GetAllModuleLeerdoelen(int moduleId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");
    builder.Where().Equal("module_id", moduleId);
    return await builder.Execute();
  }

  @override
  Future<List<Leerdoel>> GetAllUsedLeerdoelen(int moduleId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");

    // Select all unused leerdoelen
    builder.Where().In("id", _GetAllLeerdoelenConverdByModule(moduleId).WriteAsSubquery());

    return await builder.Execute();
  }

  @override
  Future<List<Leerdoel>> GetAllLesUnusedLeerdoelen(int lesId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");
    builder.Where().NotIn("id", _GetAllLesLeerdoelenForLes(lesId).WriteAsSubquery());
    return await builder.Execute();
  }

  @override
  Future<List<Leerdoel>> GetAllUnusedLeerdoelen(int moduleId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");

    // Select all unused leerdoelen
    builder.Where().NotIn("id", _GetAllLeerdoelenConverdByModule(moduleId).WriteAsSubquery());

    return await builder.Execute();
  }

  @override
  Future<List<Leerdoel>> GetAllLesLeerdoelen(int lesId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");
    builder.Where().In("id", _GetAllLesLeerdoelenForLes(lesId).WriteAsSubquery());
    return await builder.Execute();
  }

  @override
  void AddLeerdoelToLes(LesLeerdoel leerdoel) {
    DB.orm.Persist<LesLeerdoel>(leerdoel);
  }

  @override
  void PersistLeerdoel(Leerdoel leerdoel) {
    DB.orm.Persist<Leerdoel>(leerdoel);
  }

  // Private methods
  
  QueryBuilder _GetAllLesLeerdoelenForLes(int lesId){
    QueryBuilder subQuery = new QueryBuilder("LesLeerdoel");
    subQuery.Select().SetColumn("leerdoel_id");
    subQuery.Where().Equal("les_id", lesId);

    return subQuery;
  }

  QueryBuilder _GetAllLeerdoelenConverdByModule(int moduleId){
    // Select all module lessen subquery
    QueryBuilder lessenSub = new QueryBuilder("Les");
    lessenSub.Select().SetColumn("id");
    lessenSub.Where().Equal("module_id", moduleId);

    // Select leerdoelen covered by module lessen
    QueryBuilder lesleerdoelenSub = new QueryBuilder("LesLeerdoel");
    lesleerdoelenSub.Select().SetColumn("leerdoel_id");
    lesleerdoelenSub.Where().In("les_id", lessenSub.WriteAsSubquery());

    return lesleerdoelenSub;
  }
}