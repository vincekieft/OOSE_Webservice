import 'package:OOSE/Authorization/AuthorizationUser.dart';

abstract class IUserSource{
  AuthorizationUser GetCurrentUser();
}