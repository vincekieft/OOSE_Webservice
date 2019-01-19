import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/Module.dart';
import '../../Models/Opleiding.dart';

class ModuleSpecificController implements IController, IGetRequest{

  @override
  String path() {
    return "Module/:id";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    ORMQueryBuilder<Module> builder = DB.orm.StartQuery<Module>();
    builder.Where().Equal("id", args["id"]);
    builder.LeftJoin(Opleiding).EqualColumn("opleiding_id", "id");
    return await builder.ExecuteSingle();
  }

}