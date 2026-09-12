import 'package:mysql_client/mysql_client.dart';

class ServiceTipoMovimiento {
  final MySQLConnection connection;

  ServiceTipoMovimiento(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, nombre, descripcion, signo, activo FROM tipos_movimiento ORDER BY id DESC',
    );
  }
}