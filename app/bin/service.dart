import 'package:OOSE/JSON/JSON.dart';
import './Server/Server.dart';
import 'Database/DB.dart';
import 'Factories/RouterFactory.dart';
import 'Models/User.dart';
import 'Router/IRouter.dart';
import 'dart:convert';

main(List<String> args) async {
  IRouter router = new RouterFactory().CreateRouter();
  new Server(3000, router.OnRequest);
  await DB.Initialize();

  var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
  ''';

  var scores = jsonDecode(jsonString);

  var jsonText = jsonEncode(scores);

  print(jsonText);
}
