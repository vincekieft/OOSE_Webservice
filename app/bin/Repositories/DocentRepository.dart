import 'package:OOSE/ORM/ORM.dart';

import '../Database/DB.dart';
import '../Models/Docent.dart';
import '../Models/Persoon.dart';

class DocentRepository{

  Future<List<Docent>> GetAllDocenten() async{
    ORMQueryBuilder<Docent> builder = DB.orm.StartQuery<Docent>();
    builder.LeftJoin(Persoon).EqualColumn("persoon_id", "id");
    return await builder.Execute();
  }
}