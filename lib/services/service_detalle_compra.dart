import 'package:mysql_client/mysql_client.dart';

class ServiceDetalleCompra {
  final MySQLConnection connection;

  ServiceDetalleCompra(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, compra_id, producto_id, cantidad, precio_unitario, subtotal FROM detalle_compra ORDER BY id DESC',
    );
  }
}