import 'package:OOSE/Authorization/Right.dart';

class AuthorizationUser{

  // Private variables
  List<Right> _userRights;

    AuthorizationUser(List<Right> userRights){
    _userRights = userRights;
  }

  // Public methods
  /**
   * Checks whether user has access to right
   */
  bool HasAccessToRight(Right accessRight){
    if(_userRights == null){ return false; } // Guard clause to protect from empty list

    for(Right right in _userRights){
      if(right == accessRight){
        return true;
      }
    }

    return false;
  }
}