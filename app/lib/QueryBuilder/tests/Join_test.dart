import 'package:OOSE/QueryBuilder/QueryBuilder.dart';
import "package:test/test.dart";

void main() {
  group("join section test", () {

    test("Left join on target table", () {
      QueryBuilder builder = new QueryBuilder("test");
      JoinSection join = new JoinSection("LEFT JOIN", "joinTable", builder);
      join.EqualColumn("joinTable_id", "id");
      expect(join.toString(), "LEFT JOIN joinTable ON test.joinTable_id = joinTable.id");
    });

    test("Left join on target table with multiple arguments", () {
      QueryBuilder builder = new QueryBuilder("test");
      JoinSection join = new JoinSection("LEFT JOIN", "joinTable", builder);
      join.EqualColumn("joinTable_id", "id");
      join.Like("ding", "test");
      expect(join.toString(), "LEFT JOIN joinTable ON test.joinTable_id = joinTable.id AND test.ding LIKE \'test\'");
    });

    test("Test left join always before where", () {
      JoinSection join = new JoinSection("LEFT JOIN", "joinTable", null);
      WhereSection whereSection = new WhereSection(null);

      expect(whereSection.Order() > join.Order(), true);
    });
  });

}