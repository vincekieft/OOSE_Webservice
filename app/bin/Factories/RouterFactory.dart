import '../Router/IRouter.dart';
import '../Router/OOSERouter.dart';

class RouterFactory{
  IRouter CreateRouter(){
    return new OOSERouter();
  }
}