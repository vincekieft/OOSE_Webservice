import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

class Server{
  /// Private variables
  int _port;
  Function _onRequest;
  HttpServer _server;

  Server(int port, Function onRequest){
    this._port = port;
    this._onRequest = onRequest;

    Start();
  }

  /// Public methods
  void Start() async {
    var handler = const shelf.Pipeline()
        .addMiddleware(shelf.logRequests())
        .addHandler(_onRequest);

    _server = await io.serve(handler, 'localhost', this._port);
    print('Serving at http://${_server.address.host}:${_server.port}');
  }

  void Stop(){
    this._server.close();
    this._server = null;
  }
}