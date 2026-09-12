import 'package:mysql_client/mysql_client.dart';

class ServiceEstadoCompra {
  final MySQLConnection connection;

  ServiceEstadoCompra(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, nombre, descripcion, activo FROM estados_compra ORDER BY id DESC',
    );
  }
}