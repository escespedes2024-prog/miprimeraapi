import 'package:mysql_client/mysql_client.dart';

class ServiceCompra {
  final MySQLConnection connection;

  ServiceCompra(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, proveedor_id, estado_compra_id, fecha, total FROM compras ORDER BY id DESC',
    );
  }
}