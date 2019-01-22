import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import "package:test/test.dart";

void main() {
  group("Insert group", () {

    test("Insert single value", () {
      QueryBuilder builder = new QueryBuilder("test");
      InsertSection insert = new InsertSection(builder);
      insert.AddValue("naam", "name");

      expect(insert.toString(), "INSERT INTO test (test.naam) VALUES (\'name\')");
    });

  });

}