import 'package:mysql_client/mysql_client.dart';

class ServiceDetalleVenta {
  final MySQLConnection connection;

  ServiceDetalleVenta(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, venta_id, producto_id, cantidad, precio_unitario, subtotal FROM detalle_venta ORDER BY id DESC',
    );
  }
}