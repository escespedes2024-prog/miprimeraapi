import 'package:mysql_client/mysql_client.dart';

class Database {
  static Future<MySQLConnection> connet() async{
    final connection = await MySQLConnection.createConnection(
        host: '127.0.0.1',
        port: 3306,
        userName: 'root',
        password: '',
        databaseName: 'apidart',
    );
    await connection.connect();
    return connection;
  }
}