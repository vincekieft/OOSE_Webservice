library Router;

import 'package:OOSE/JSON/JSON.dart';
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
  Future<Response> Route(String path, String method) async{
    PathComparator comparator = _findPathMatch(path);

    if(comparator != null){
      Object result = await _invokeControllerMethod(comparator, method);
      print(result.runtimeType);
      if(result != null) return new Response.ok(JSON.Encode(result));
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

  Future<Object> _invokeControllerMethod(PathComparator comparator, String method) async{
    InstanceMirror mirror = reflect(comparator.Controller);
    Symbol methodSymbol = new Symbol(method);

    if(mirror.type.declarations.containsKey(methodSymbol)){
      return await mirror.invoke(methodSymbol, [comparator.Arguments]).reflectee;
    }

    return null;
  }
}