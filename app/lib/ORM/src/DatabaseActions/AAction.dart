import 'dart:mirrors';

import 'package:OOSE/ORM/ORM.dart';

abstract class AAction{

  // Private variables
  dynamic _model;
  ORM _orm;
  InstanceMirror _mirror;

  AAction(dynamic model, ORM orm){
    _orm = orm;
    _model = model;
    _mirror = reflect(model);
  }

  // Getters
  dynamic get Model => _model;
  ORM get Orm => _orm;
  InstanceMirror get Mirror => _mirror;
}