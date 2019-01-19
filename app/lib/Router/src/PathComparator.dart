import 'IController.dart';

class PathComparator{

  /// Private variables

  String _requestPath;
  IController _controller;
  List<String> _splittedController;
  List<String> _splittedRequest;
  Map<String,dynamic> _arguments;

  PathComparator(IController controller, String request, [String body = ""]){
    this._controller = controller;
    this._requestPath = request.toLowerCase();
    _initializeSplittedPaths();
  }

  /// public method

  bool IsEqual(){
    if(!EqualLength) return false;
    return _listEquality(_splittedController,_splittedRequest);
  }

  void AddArgument(String key, dynamic value){
    _arguments[key] = value;
  }

  /// Getters

  bool get EqualLength => _splittedController.length == _splittedRequest.length;
  IController get Controller => _controller;
  Map<String,dynamic> get Arguments => _arguments;

  /// Private methods

  void _initializeSplittedPaths(){
    // Initialize arrays
    List<String> argumentSplit = _requestPath.split("?");
    _splittedRequest = _clearOutEmpty(argumentSplit.first.split("/"));
    _splittedController = _clearOutEmpty(_controller.path().toLowerCase().split("/"));
    _arguments = new Map<String,dynamic>();

    if(argumentSplit.length > 0) _addStringArguments(argumentSplit.last);
    _matchSplittedPaths();
  }

  List<String> _clearOutEmpty(List<String> input){
    for (int i = 0; i < input.length; i++) {
      if(input[i] == ""){
        input.removeAt(i);
        i--;
      }
    }
    return input;
  }

  void _matchSplittedPaths(){
    if(!EqualLength) return;
    for (int i = 0; i < _splittedRequest.length; i++) {
      if(_splittedController[i].substring(0,1) == ":"){
        String controllerPart = _splittedController[i];
        _addArgument(_splittedRequest[i],controllerPart.substring(1,controllerPart.length));
        _splittedController[i] = _splittedRequest[i];
      }
    }
  }

  void _addArgument(dynamic arg,String key){
    arg = int.tryParse(arg) ?? arg;
    _arguments[key] = arg;
  }

  void _addStringArguments(String args){
    List<String> splitArgs = args.split("&");
    for (var arg in splitArgs) {
      List<String> splitArg = arg.split("=");
      if(splitArg.length == 2) {
        _addArgument(splitArg.last, splitArg.first);
      }
    }
  }

  bool _listEquality(List<dynamic> a, List<dynamic> b){
    for(int i = 0; i < a.length; i++){
      if(a[i] != b[i]) return false;
    }
    return true;
  }
}