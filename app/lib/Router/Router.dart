library Router;

import 'package:shelf/shelf.dart';
import './src/IController.dart';
import 'dart:mirrors';
import 'dart:convert';
import 'src/PathComparator.dart';

export './src/IController.dart';
export './src/Types/IPostRequest.dart';
export './src/Types/IGetRequest.dart';

abstract class Router{
  /// Private variables
  List<IController> _controllers = new List<IController>();

  /// Constructor
  Router(List<IController> controllers){
    AddControllers(controllers); /// Add default controllers
  }

  /// Route to a given path and call controller
  Response Route(String path, String method){
    PathComparator comparator = _findPathMatch(path);

    if(comparator != null){
      Object result = _invokeControllerMethod(comparator, method);
      if(result != null) return new Response.ok(jsonEncode(result));
    }

    return _notFoundResponse();
  }

  /// Adds [controller] to router controllers
  void AddController(IController controller){
    AddControllers([controller]);
  }

  /// Adds range of [controllers] to router controllers
  void AddControllers(List<IController> controllers){
    _controllers.addAll(controllers);
  }

  /// Private methods ------------------------------------------------------------------------

  PathComparator _findPathMatch(String path){
    for(IController controller in _controllers){
      PathComparator comparator = new PathComparator(controller, path);
      if(comparator.IsEqual()) return comparator;
    }

    return null;
  }

  Response _notFoundResponse(){
    return new Response.notFound("");
  }

  Object _invokeControllerMethod(PathComparator comparator, String method){
    InstanceMirror mirror = reflect(comparator.Controller);
    Symbol methodSymbol = new Symbol(method);

    if(mirror.type.declarations.containsKey(methodSymbol)){
      return mirror.invoke(methodSymbol, [comparator.Arguments]).reflectee;
    }

    return null;
  }
}