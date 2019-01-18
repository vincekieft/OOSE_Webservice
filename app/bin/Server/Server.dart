import 'dart:io';

class Server{
  /// Private variables
  int _port;
  Function _onRequest;

  Server(int port, Function onRequest){
    this._port = port;
    this._onRequest = onRequest;

    Start();
  }

  /// Public methods
  void Start() async {
    HttpServer server = await HttpServer.bind('0.0.0.0', this._port);

    print('Serving at http://${server.address.host}:${server.port}');

    await for (HttpRequest req in server) {
      await _onRequest(req);
      req.response.close();
    }
  }
}