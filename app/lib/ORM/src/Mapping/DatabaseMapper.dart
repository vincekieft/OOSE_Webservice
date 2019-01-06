class DatabaseMapper{ // TODO implement name mapping functionality

  // Private variables
  Map<String,String> _mappings = new Map<String,String>();

  // Public methods
  void RegisterMapping(String from, String to){
    _mappings[from] = to;
  }

  // Getters
  Map<String, String> get Mappings => _mappings;
}