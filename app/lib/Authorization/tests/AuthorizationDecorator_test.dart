import 'package:OOSE/Authorization/AuthorizationDecorator.dart';
import 'package:OOSE/Authorization/AuthorizationUser.dart';
import 'package:OOSE/Authorization/IFunctionality';
import 'package:OOSE/Authorization/IUserSource.dart';
import 'package:OOSE/Authorization/Right.dart';
import "package:test/test.dart";

void main() {
  group("Authorization test group", () {

    test("Test success senario authorization where has rights returns true", () {
      TestAdminUser user = new TestAdminUser(true);
      UserSourceTest userSource = new UserSourceTest(user);
      ProtectedTest resource = new ProtectedTest();

      AuthorizationDecorator decorator = new AuthorizationDecorator<String>(resource, null, userSource);

      String result = decorator.Execute(null);
      expect(result, "success");
    });

    test("Test fail senario authorization where has rights returns true", () {
      TestAdminUser user = new TestAdminUser(false);
      UserSourceTest userSource = new UserSourceTest(user);
      ProtectedTest resource = new ProtectedTest();

      AuthorizationDecorator decorator = new AuthorizationDecorator<String>(resource, null, userSource);

      expect(() => decorator.Execute(null), throwsA(predicate((e)=> e is Exception)));
    });

  });

}

class UserSourceTest implements IUserSource{

  // Private variables
  AuthorizationUser _user;


  UserSourceTest(AuthorizationUser user){
    _user = user;
  }

  @override
  AuthorizationUser GetCurrentUser() {
    return _user;
  }

}

class ProtectedTest implements IFunctionality<String>{
  @override
  String Execute (arguments) {
    return "success";
  }

}

class TestAdminUser extends AuthorizationUser{

  // Private variables
  bool _hasRights;

  TestAdminUser(bool hasRights) : super(null){
    _hasRights = hasRights;
  }

  @override
  bool HasAccessToRight(Right accessRight){
    return _hasRights;
  }
}