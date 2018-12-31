import 'package:OOSE/ORM/src/Result/QueryResult.dart';
import 'package:OOSE/ORM/src/ResultAdapter/SqlJockyAdapter.dart';
import 'IDatabaseAdapter.dart';
import 'package:sqljocky5/sqljocky.dart';

class MysqlAdapter implements IDatabaseAdapter{

  // Private variables
  MySqlConnection _connection;

  @override
  void Connect(String host, int port, String db, String user, String password) async {
    ConnectionSettings settings = ConnectionSettings(
      user: user,
      password: password,
      host: host,
      port: port,
      db: db,
    );

    _connection = await MySqlConnection.connect(settings);
  }

  @override
  void Disconnect() {
    _connection.close();
  }

  @override
  Future<QueryResult> Execute(String query) async {
    return new SqlJockyAdapter(await _connection.execute(query));
  }

}