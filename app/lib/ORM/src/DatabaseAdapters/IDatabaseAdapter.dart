import 'package:OOSE/ORM/src/Result/QueryResult.dart';

abstract class IDatabaseAdapter{
  void Connect(String host, int port, String db, String user, String password);
  Future<QueryResult> Execute(String query);
  void Disconnect();
}