import 'package:mysql_client/mysql_client.dart';

class ServiceMetodoPago {
  final MySQLConnection connection;

  ServiceMetodoPago(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, nombre, descripcion, activo FROM metodos_pago ORDER BY id DESC',
    );
  }
}