import 'package:OOSE/ORM/ORM.dart';
import '../Database/DB.dart';
import '../Models/Module.dart';
import '../Models/Opleiding.dart';

class ModulesRepository{

  Future<List<Module>> GetAllModules() async{
    ORMQueryBuilder<Module> builder = DB.orm.StartQuery<Module>();
    builder.LeftJoin(Opleiding).EqualColumn("opleiding_id", "id");
    return await builder.Execute();
  }
}