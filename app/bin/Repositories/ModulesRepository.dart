import 'package:OOSE/ORM/ORM.dart';
import '../Database/DB.dart';
import '../Models/Module.dart';
import '../Models/Opleiding.dart';
import '../RepositoryInterfaces/IModulesRepository.dart';

class ModulesRepository implements IModulesRepository{

  @override
  Future<List<Module>> GetAllModules() async{
    ORMQueryBuilder<Module> builder = _BaseBuilder();
    return await builder.Execute();
  }

  @override
  Future<List<Module>> GetAllEducationModules(int educationId) async{
    ORMQueryBuilder<Module> builder = _BaseBuilder();
    builder.Where().Equal("opleiding_id", educationId);
    return await builder.Execute();
  }

  @override
  void PersistModule(Module module) {
    DB.orm.Persist<Module>(module);
  }

  @override
  Future<Module> GetModuleById(int id) async{
    ORMQueryBuilder<Module> builder = DB.orm.StartQuery<Module>();
    builder.Where().Equal("id", id);
    builder.LeftJoin(Opleiding).EqualColumn("opleiding_id", "id");
    return await builder.ExecuteSingle();
  }

  // Private methods
  ORMQueryBuilder<Module> _BaseBuilder(){
    ORMQueryBuilder<Module> builder = DB.orm.StartQuery<Module>();
    builder.LeftJoin(Opleiding).EqualColumn("opleiding_id", "id");
    return builder;
  }
}