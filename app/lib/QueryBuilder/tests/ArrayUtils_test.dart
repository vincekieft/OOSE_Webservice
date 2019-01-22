import 'package:OOSE/QueryBuilder/src/Criteria.dart';
import 'package:OOSE/QueryBuilder/src/Utils/ArrayUtils.dart';
import "package:test/test.dart";

void main() {
  group("Array utils group", () {

    test("Test join IWritables", () {
      String result = ArrayUtils.JoinWritables<Criteria>([new Criteria("id","=",10), new Criteria("id",">",20), new Criteria("id","<",30)], ",");
      expect(result, "id = 10,id > 20,id < 30");
    });

    test("Test join map IWritables", () {
      Map<String, Criteria> map = new Map();
      map["test1"] = new Criteria("id","=",10);
      map["test2"] = new Criteria("id",">",20);
      map["test3"] = new Criteria("id","<",30);

      String result = ArrayUtils.JoinMapWritables<String, Criteria>(map, ",");
      expect(result, "id = 10,id > 20,id < 30");
    });

    test("Test join List", () {
      String result = ArrayUtils.JoinList(["10", "20", "30"], "+");
      expect(result, "10+20+30");
    });

    test("Test join List nulls", () {
      String result = ArrayUtils.JoinList([null, "20", null, "10"], "+");
      expect(result, "20+10");
    });

    test("Test join Map values", () {
      Map<int,int> map = new Map();
      map[0] = 10;
      map[1] = 40;
      map[10] = 30;
      String result = ArrayUtils.JoinMapValues(map, "+");
      expect(result, "10+40+30");
    });

    test("Test join Map keys", () {
      Map<int,int> map = new Map();
      map[0] = 10;
      map[1] = 40;
      map[10] = 30;
      String result = ArrayUtils.JoinMapKeys(map, "+");
      expect(result, "0+1+10");
    });

  });

}