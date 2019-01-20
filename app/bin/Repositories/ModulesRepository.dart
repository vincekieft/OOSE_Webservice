import 'package:OOSE/ORM/ORM.dart';
import '../Database/DB.dart';
import '../Models/Module.dart';
import '../Models/Opleiding.dart';

class ModulesRepository{

  Future<List<Module>> GetAllModules() async{
    ORMQueryBuilder<Module> builder = _BaseBuilder();
    return await builder.Execute();
  }

  Future<List<Module>> GetAllEducationModules(int educationId) async{
    ORMQueryBuilder<Module> builder = _BaseBuilder();
    builder.Where().Equal("opleiding_id", educationId);
    return await builder.Execute();
  }

  // Private methods
  ORMQueryBuilder<Module> _BaseBuilder(){
    ORMQueryBuilder<Module> builder = DB.orm.StartQuery<Module>();
    builder.LeftJoin(Opleiding).EqualColumn("opleiding_id", "id");
    return builder;
  }
}