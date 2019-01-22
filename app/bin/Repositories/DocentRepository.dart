import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/QueryBuilder/QueryBuilder.dart';

import '../Database/DB.dart';
import '../Models/Docent.dart';
import '../Models/LesDocent.dart';
import '../Models/Persoon.dart';
import '../RepositoryInterfaces/IDocentRepository.dart';

class DocentRepository implements IDocentRepository{

  @override
  Future<List<Docent>> GetAllDocenten() async{
    return await _BaseBuilder().Execute();
  }

  @override
  Future<List<Docent>> GetAllLesDocenten(int lesId) async{
    ORMQueryBuilder<Docent> builder = _BaseBuilder();
    builder.Where().In("id", _SelectLesDocentent(lesId).WriteAsSubquery());
    return await builder.Execute();
  }

  @override
  Future<List<Docent>> GetAllUnusedLesDocenten(int lesId) async{
    ORMQueryBuilder<Docent> builder = _BaseBuilder();
    builder.Where().NotIn("id", _SelectLesDocentent(lesId).WriteAsSubquery());
    return await builder.Execute();
  }

  @override
  void PersistDocent(Docent docent) {
    DB.orm.Persist<Docent>(docent);
  }

  @override
  void AddDocentToLes(LesDocent docent) {
    DB.orm.Persist<LesDocent>(docent);
  }

  // Private methods
  QueryBuilder _SelectLesDocentent(int lesId){
    QueryBuilder subQuery = new QueryBuilder("LesDocent");
    subQuery.Select().SetColumn("docent_id");
    subQuery.Where().Equal("les_id", lesId);
    return subQuery;
  }


  ORMQueryBuilder<Docent> _BaseBuilder(){
    ORMQueryBuilder<Docent> builder = DB.orm.StartQuery<Docent>();
    builder.LeftJoin(Persoon).EqualColumn("persoon_id", "id");
    return builder;
  }
}