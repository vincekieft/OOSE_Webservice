import 'package:OOSE/ORM/src/Annotations/Base/RuntimeClassReflection.dart';
import 'package:OOSE/ORM/src/QueryBuilder/ORMQueryBuilder.dart';
import './Server/Server.dart';
import 'Database/DB.dart';
import 'Factories/RouterFactory.dart';
import 'Models/Ding.dart';
import 'Models/User.dart';
import 'Router/IRouter.dart';

main(List<String> args) async {
  IRouter router = new RouterFactory().CreateRouter();
  new Server(3000, router.OnRequest);
  await DB.Initialize();

  ORMQueryBuilder<User> builder = DB.orm.StartQuery<User>();
  builder.Where().Equal("id", 2);
  builder.LeftJoin(Ding).EqualColumn("id", "user_id");


  User user = await builder.ExecuteSingle();
  print(user.dingen);
}
