import 'package:OOSE/ORM/ORM.dart';
import '../Database/DB.dart';
import '../Models/Document.dart';
import '../Models/Les.dart';
import '../Models/Module.dart';
import '../RepositoryInterfaces/ILesRepository.dart';

class LesRepository implements ILesRepository{

  @override
  Future<List<Les>> GetAllModuleLessen(int module) async{
    ORMQueryBuilder<Les> builder = DB.orm.StartQuery<Les>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");
    builder.LeftJoin(Document).EqualColumn("document_id", "id");
    builder.Where().Equal("module_id", module);
    return await builder.Execute();
  }

  @override
  Future<Les> GetLesById(int id) async{
    ORMQueryBuilder<Les> builder = DB.orm.StartQuery<Les>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");
    builder.LeftJoin(Document).EqualColumn("document_id", "id");
    builder.Where().Equal("id", id);
    return await builder.ExecuteSingle();
  }

  @override
  void PersistLes(Les les) {
    DB.orm.Persist<Les>(les);
  }
}