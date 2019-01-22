import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/Criteria.dart';
import "package:test/test.dart";

void main() {
  group("Where section test", () {

    test("Test where equal output", () {
      QueryBuilder builder = new QueryBuilder("test");
      WhereSection where = new WhereSection(builder);
      where.Equal("id", 1);

      expect(where.toString(), "WHERE test.id = 1");
    });

    test("Test multiple equal output", () {
      QueryBuilder builder = new QueryBuilder("test");
      WhereSection where = new WhereSection(builder);
      where.Equal("id", 1);
      where.EqualColumn("id", "test");

      expect(where.toString(), "WHERE test.id = 1 AND test.id = test.test");
    });


    test("Test target table", () {
      QueryBuilder builder = new QueryBuilder("test");
      WhereSection where = new WhereSection(builder);
      where.EqualColumn("id", "test", "target");

      expect(where.toString(), "WHERE test.id = target.test");
    });
  });

}