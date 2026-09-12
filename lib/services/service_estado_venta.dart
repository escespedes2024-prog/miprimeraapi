import 'package:mysql_client/mysql_client.dart';

class ServiceEstadoVenta {
  final MySQLConnection connection;

  ServiceEstadoVenta(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, nombre, descripcion, activo FROM estados_venta ORDER BY id DESC',
    );
  }
}