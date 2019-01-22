import 'package:OOSE/QueryBuilder/src/Criteria.dart';
import "package:test/test.dart";

void main() {
  group("Criteria toString() group", () {


    test("Test how criteria prints boolean value", () {
      Criteria criteria = new Criteria("id","=",true);
      expect(criteria.toString(), "id = true");
    });

    test("Test how criteria prints null value", () {
      Criteria criteria = new Criteria("id","=",null);
      expect(criteria.toString(), "id = NULL");
    });

    test("Test how criteria prints int value", () {
      Criteria criteria = new Criteria("id","=",10);
      expect(criteria.toString(), "id = 10");
    });

    test("Test how criteria prints double value", () {
      Criteria criteria = new Criteria("id","=",50.23);
      expect(criteria.toString(), "id = 50.23");
    });

    test("Test how criteria prints date value", () {
      Criteria criteria = new Criteria("id","=",new DateTime(1997,4,4));
      expect(criteria.toString(), "id = 1997-04-04 00:00:00.000");
    });

    test("Test how criteria prints subquery", () {
      Criteria criteria = new Criteria("id","=","(SELECT * FROM TEST WHERE id = 10)");
      expect(criteria.toString(), "id = (SELECT * FROM TEST WHERE id = 10)");
    });

    test("Test how criteria prints null column", () {
      Criteria criteria = new Criteria(null,"=", 10);
      expect(criteria.toString(), "= 10");
    });

    test("Test how criteria prints null operator", () {
      Criteria criteria = new Criteria("id",null, 10);
      expect(criteria.toString(), "id 10");
    });
  });

}