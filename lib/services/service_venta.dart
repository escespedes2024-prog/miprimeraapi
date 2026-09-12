import 'package:mysql_client/mysql_client.dart';

class ServiceVenta {
  final MySQLConnection connection;

  ServiceVenta(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, cliente_id, fecha, total, estado FROM ventas ORDER BY id DESC',
    );
  }
}