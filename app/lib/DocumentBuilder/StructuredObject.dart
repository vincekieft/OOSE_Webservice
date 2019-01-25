class StructuredObject {

  String _type,_value;

  String get type =>_type;
  String get value =>_value;
  Map<String,String> get attributes => _attributes;
  List<StructuredObject> get children => _children;

  Map<String,String> _attributes = new Map<String,String>();
  List<StructuredObject> _children = new List<StructuredObject>();

  set value(String value) => _value = value;
  set type(String type) => _type = type;

  /**
   * Adds a attribute
   */
  void addAttribute(String key, String value){
    _attributes[key] = value;
  }

  /**
   * Adds a child
   */
  void addChild(StructuredObject child){
    _children.add(child);
  }

}