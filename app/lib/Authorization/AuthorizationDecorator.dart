import 'package:OOSE/Authorization/AuthorizationUser.dart';
import 'package:OOSE/Authorization/IFunctionality.dart';
import 'package:OOSE/Authorization/IUserSource.dart';
import 'package:OOSE/Authorization/Right.dart';

  class AuthorizationDecorator<T> implements IFunctionality<T>{

  // Private variables
  IFunctionality _protected;
  IUserSource _userSource;
  Right _accessRight;

  AuthorizationDecorator(IFunctionality protected, Right accessRight, IUserSource userSource){
    _protected = protected;
    _userSource = userSource;
    _accessRight = accessRight;
  }

  @override
  T Execute (arguments) {
    _VerifyUserRights(_userSource, _accessRight);
    return _protected.Execute(arguments); // Call protected function since user has the right to use it
  }

  // Private methods
  /**
   * Verifies whether current user from UserSource has access to the accessRight. If not an exception is thrown
   */
  void _VerifyUserRights(IUserSource source, Right accessRight){
    AuthorizationUser currentUser = source.GetCurrentUser();
    bool isAuthorized = _IsUserAuthorized(currentUser, accessRight);

    if(!isAuthorized){
      throw new Exception("Unauthorized access is denied");
    }
  }

  /**
   * Returns true if given authorization user has access to the given accessRight and false if not
   */
  bool _IsUserAuthorized(AuthorizationUser user, Right accessRight){
    if(user == null){ return false; } // Guard clause to protect from empty user
    return user.HasAccessToRight(accessRight);
  }
}