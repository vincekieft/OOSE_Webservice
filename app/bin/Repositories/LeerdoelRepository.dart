import 'package:OOSE/ORM/src/QueryBuilder/ORMQueryBuilder.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import '../Database/DB.dart';
import '../Models/Leerdoel.dart';
import '../Models/Module.dart';

class LeerdoelRepository{

  Future<List<Leerdoel>> GetAllModuleLeerdoelen(int moduleId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");
    builder.Where().Equal("module_id", moduleId);
    return await builder.Execute();
  }

  Future<List<Leerdoel>> GetAllUsedLeerdoelen(int moduleId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");

    // Select all unused leerdoelen
    builder.Where().In("id", _GetAllLeerdoelenConverdByModule(moduleId).WriteAsSubquery());

    return await builder.Execute();
  }

  Future<List<Leerdoel>> GetAllLesUnusedLeerdoelen(int lesId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");

    // Sub query to for many to many
    QueryBuilder subQuery = new QueryBuilder("LesLeerdoel");
    subQuery.Select().SetColumn("leerdoel_id");
    subQuery.Where().Equal("les_id", lesId);

    builder.Where().NotIn("id", subQuery.WriteAsSubquery());
    return await builder.Execute();
  }

  Future<List<Leerdoel>> GetAllUnusedLeerdoelen(int moduleId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");

    // Select all unused leerdoelen
    builder.Where().NotIn("id", _GetAllLeerdoelenConverdByModule(moduleId).WriteAsSubquery());

    return await builder.Execute();
  }

  Future<List<Leerdoel>> GetAllLesLeerdoelen(int lesId) async{
    ORMQueryBuilder<Leerdoel> builder = DB.orm.StartQuery<Leerdoel>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");

    // Sub query to for many to many
    QueryBuilder subQuery = new QueryBuilder("LesLeerdoel");
    subQuery.Select().SetColumn("leerdoel_id");
    subQuery.Where().Equal("les_id", lesId);

    builder.Where().In("id", subQuery.WriteAsSubquery());
    return await builder.Execute();
  }

  // Private methods
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