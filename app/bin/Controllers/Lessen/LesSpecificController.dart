import 'package:OOSE/ORM/ORM.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/Document.dart';
import '../../Models/Les.dart';
import '../../Models/Module.dart';

class LesSpecificController implements IController, IGetRequest{

  @override
  String path() {
    return "Class/:id";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async{
    ORMQueryBuilder<Les> builder = DB.orm.StartQuery<Les>();
    builder.LeftJoin(Module).EqualColumn("module_id", "id");
    builder.LeftJoin(Document).EqualColumn("document_id", "id");
    builder.Where().Equal("id", args["id"]);
    return await builder.ExecuteSingle();
  }

}