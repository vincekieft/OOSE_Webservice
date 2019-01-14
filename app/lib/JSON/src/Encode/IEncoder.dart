abstract class IEncoder{
  String Encode(dynamic value);
  Type ParseType();
  int Priority();
  bool IsOfType(dynamic object);
}