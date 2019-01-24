import 'package:OOSE/Authorization/AuthorizationUser.dart';
import 'package:OOSE/Authorization/IProtectedFunction.dart';
import 'package:OOSE/Authorization/IUserSource.dart';
import 'package:OOSE/Authorization/Right.dart';

  class AuthorizationDecorator implements IProtectedFunction{

  // Private variables
  IProtectedFunction _protected;
  IUserSource _userSource;
  Right _accessRight;

  AuthorizationDecorator(IProtectedFunction protected, Right accessRight, IUserSource userSource){
    _protected = protected;
    _userSource = userSource;
    _accessRight = accessRight;
  }

  @override
  void ProtectedFunction(arguments) {
    _VerifyUserRights(_userSource, _accessRight);
    _protected.ProtectedFunction(arguments); // Call protected function since user has the right to use it
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