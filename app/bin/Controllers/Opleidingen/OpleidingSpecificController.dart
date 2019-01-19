import 'package:OOSE/ORM/src/QueryBuilder/ORMQueryBuilder.dart';
import 'package:OOSE/Router/Router.dart';
import '../../Database/DB.dart';
import '../../Models/Opleiding.dart';

class OpleidingSpecificController implements IController, IGetRequest{

  @override
  String path() {
    return "Education/:id";
  }

  @override
  Future<Object> GET(Map<String, dynamic> args) async {
    ORMQueryBuilder<Opleiding> builder = DB.orm.StartQuery<Opleiding>();
    builder.Where().Equal("id", args["id"]);
    return await builder.ExecuteSingle();
  }

}