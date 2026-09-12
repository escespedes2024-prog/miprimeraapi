import 'package:mysql_client/mysql_client.dart';

class ServiceMovimientoInventario {
  final MySQLConnection connection;

  ServiceMovimientoInventario(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, producto_id, tipo_movimiento_id, cantidad, referencia, fecha FROM movimientos_inventario ORDER BY id DESC',
    );
  }
}