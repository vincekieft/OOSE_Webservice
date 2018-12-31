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
  DB.Persist(new Ding("Kippiee",new User("Hond",3000)));
}
