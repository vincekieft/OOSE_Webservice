import 'package:OOSE/ORM/ORM.dart';

import '../Database/DB.dart';
import '../Models/Opleiding.dart';

class OpleidingRepository{

  Future<List<Opleiding>> GetAllOpleidingen() async{
    ORMQueryBuilder<Opleiding> builder = DB.orm.StartQuery<Opleiding>();
    return await builder.Execute();
  }
}