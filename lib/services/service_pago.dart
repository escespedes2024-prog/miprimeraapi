import 'package:mysql_client/mysql_client.dart';

class ServicePago {
  final MySQLConnection connection;

  ServicePago(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, venta_id, metodo_pago_id, monto, fecha, referencia FROM pagos ORDER BY id DESC',
    );
  }
}