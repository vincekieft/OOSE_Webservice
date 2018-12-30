abstract class IDatabaseAdapter{
  void Connect(String host, int port, String db, String user, String password);
  dynamic Execute(String query);
  void Disconnect();
}