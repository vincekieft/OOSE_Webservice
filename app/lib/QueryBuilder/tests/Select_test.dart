import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import "package:test/test.dart";

void main() {
  group("Select tests group", () {

    test("Select single column query", () {
      QueryBuilder builder = new QueryBuilder("test");
      SelectSection select = new SelectSection(builder);
      select.SetColumn("id");
      expect(select.toString(), "SELECT test.id AS \'id\' FROM test");
    });

    test("Select all query", () {
      QueryBuilder builder = new QueryBuilder("test");
      SelectSection select = new SelectSection(builder);
      select.SelectAll();
      expect(select.toString(), "SELECT test.* NULL FROM test");
    });

    test("Select multiple columns query", () {
      QueryBuilder builder = new QueryBuilder("test");
      SelectSection select = new SelectSection(builder);
      select.SetColumn("name");
      select.SetColumn("id");

      expect(select.toString(), "SELECT test.name AS \'name\',test.id AS \'id\' FROM test");
    });

    test("Select from multiple tables query", () {
      QueryBuilder builder = new QueryBuilder("test");
      SelectSection select = new SelectSection(builder);
      select.SetColumn("id");
      select.SetColumn("id", "other");

      expect(select.toString(), "SELECT test.id AS \'id\',other.id AS \'id\' FROM test");
    });

    test("Select named column", () {
      QueryBuilder builder = new QueryBuilder("test");
      SelectSection select = new SelectSection(builder);
      select.SetNamedColumn("id", "namedId");

      expect(select.toString(), "SELECT test.id AS \'namedId\' FROM test");
    });

  });

}