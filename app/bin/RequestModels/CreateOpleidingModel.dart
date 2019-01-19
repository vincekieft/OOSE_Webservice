import '../Models/Opleiding.dart';

class CreateOpleidingModel{
  String name;
  int year;

  // Public methods
  Opleiding ToOpleiding(){
    Opleiding opleiding = new Opleiding();
    opleiding.naam = name;
    opleiding.startjaar = year;
    return opleiding;
  }
}