import 'package:OOSE/ORM/ORM.dart';

import '../Database/DB.dart';
import '../Models/Les.dart';
import '../Models/Module.dart';

class LesRepository{

  Future<List<Les>> GetAllModuleLessen(int module) async{
    ORMQueryBuilder<Les> builder = DB.orm.StartQuery<Les>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");
    builder.Where().Equal("module_id", module);
    return await builder.Execute();
  }
}