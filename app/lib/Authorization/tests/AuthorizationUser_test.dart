import 'package:OOSE/Authorization/AuthorizationUser.dart';
import 'package:OOSE/Authorization/Right.dart';
import "package:test/test.dart";

void main() {
  group("Authorization User test group", () {

    test("Test wheter authorization user has access to right method works correctly when correct information is provided", () {
      Right right = new Right("String");
      Right right2 = new Right("String1");
      Right right3 = new Right("String4");

      AuthorizationUser user = new AuthorizationUser([right2, right, right3]);

      expect(user.HasAccessToRight(right), true);
    });

    test("Test wheter authorization method works correctly when incorrect information is provided", () {
      Right right = new Right("String");
      Right right2 = new Right("String1");
      Right right3 = new Right("String4");

      AuthorizationUser user = new AuthorizationUser([right2, right3]);

      expect(user.HasAccessToRight(right), false);
    });

    test("Test wheter authorization method works correctly null is passed to method", () {
      Right right = new Right("String");
      Right right2 = new Right("String1");
      Right right3 = new Right("String4");

      AuthorizationUser user = new AuthorizationUser([right2, right3]);

      expect(user.HasAccessToRight(null), false);
    });

    test("Test wheter authorization method works correctly null is passed to authorization user constructor", () {
      AuthorizationUser user = new AuthorizationUser(null);

      expect(user.HasAccessToRight(null), false);
    });

  });

}