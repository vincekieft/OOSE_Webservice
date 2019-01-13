abstract class IParser{
  String Encode(dynamic value);
  Type ParseType();
  int Priority();
  bool IsOfType(dynamic object);
}