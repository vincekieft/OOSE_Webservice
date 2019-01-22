import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import 'package:OOSE/QueryBuilder/src/QuerySections/DeleteSection.dart';
import "package:test/test.dart";

void main() {
  test("Test delete section", () {
    QueryBuilder builder = new QueryBuilder("test");
    DeleteSection delete = new DeleteSection(builder);
    expect(delete.toString(), "DELETE  FROM test");
  });

  test("Test delete with multiple tables", () {
    QueryBuilder builder = new QueryBuilder("test");
    builder.LeftJoin("test2").EqualColumn("test_id", "id");
    DeleteSection delete = new DeleteSection(builder);
    expect(delete.toString(), "DELETE test,test2 FROM test");
  });

}