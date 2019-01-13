import 'package:OOSE/JSON/JSON.dart';

import './Server/Server.dart';
import 'Database/DB.dart';
import 'Factories/RouterFactory.dart';
import 'Models/User.dart';
import 'Router/IRouter.dart';

main(List<String> args) async {
  IRouter router = new RouterFactory().CreateRouter();
  new Server(3000, router.OnRequest);
  await DB.Initialize();

  String test = """
  {
    "glossary": {
        "title": "example glossary",
		"GlossDiv": {
            "title": "S",
			"GlossList": {
                "GlossEntry": {
                    "ID": "SGML",
					"SortAs": "SGML",
					"GlossTerm": "Standard Generalized Markup Language",
					"Acronym": "SGML",
					"Abbrev": "ISO 8879:1986",
					"GlossDef": {
                        "para": "A meta-markup language, used to create markup languages such as DocBook.",
						"GlossSeeAlso": ["GML", "XML"]
                    },
					"GlossSee": "markup"
                }
            }
        }
    }
  }
  """;

  String test2 = '{ "id":1,"name":"Vince Kieft","tel":685948596,"dingen":[] }';

  User u = JSON.Decode<User>(test);
  print(u.name);
}
