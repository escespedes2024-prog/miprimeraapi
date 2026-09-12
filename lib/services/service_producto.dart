import 'package:mysql_client/mysql_client.dart';

class ServiceProducto {
  final MySQLConnection connection;

  ServiceProducto(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, nombre, precio FROM productos ORDER BY id DESC',
    );
  }
}