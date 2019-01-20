import 'dart:io';
import '../Controllers/Docenten/DocentController.dart';
import '../Controllers/Docenten/DocentenController.dart';
import '../Controllers/Docenten/LesDocentController.dart';
import '../Controllers/Leerdoel/LeerdoelController.dart';
import '../Controllers/Leerdoel/LeerdoelenController.dart';
import '../Controllers/Leerdoel/LesLeerdoelController.dart';
import '../Controllers/Leerdoel/LesUnusedLeerdoelenController.dart';
import '../Controllers/Leerdoel/ModuleLeerdoelenController.dart';
import '../Controllers/Leerdoel/LeerdoelenStatusController.dart';
import '../Controllers/Lessen/LesController.dart';
import '../Controllers/Lessen/LesSpecificController.dart';
import '../Controllers/Lessen/LessenController.dart';
import '../Controllers/Modules/ModuleController.dart';
import '../Controllers/Modules/ModuleSpecificController.dart';
import '../Controllers/Modules/ModulesController.dart';
import '../Controllers/Opleidingen/OpleidingController.dart';
import '../Controllers/Opleidingen/OpleidingSpecificController.dart';
import '../Controllers/Opleidingen/OpleidingenController.dart';
import '../Controllers/Studenten/ModuleStudentController.dart';
import '../Controllers/Studenten/ModuleUnusedStudentsController.dart';
import '../Controllers/Studenten/StudentController.dart';
import '../Controllers/Studenten/StudentenController.dart';
import 'IRouter.dart';
import 'package:OOSE/Router/Router.dart';

class OOSERouter extends Router implements IRouter{
  OOSERouter() : super([
    new OpleidingController(),
    new StudentenController(),
    new StudentController(),
    new DocentenController(),
    new DocentController(),
    new OpleidingenController(),
    new OpleidingSpecificController(),
    new ModulesController(),
    new ModuleSpecificController(),
    new ModuleController(),
    new LessenController(),
    new LesController(),
    new LesSpecificController(),
    new LeerdoelenController(),
    new ModuleLeerdoelenController(),
    new LeerdoelenStatusController(),
    new LeerdoelController(),
    new LesLeerdoelController(),
    new LesDocentController(),
    new ModuleStudentController(),
    new LesUnusedLeerdoelenController(),
    new ModuleUnusedStudentsController()
  ]);

  @override
  void OnRequest(HttpRequest request) async{
    await Route(request);
  }
}