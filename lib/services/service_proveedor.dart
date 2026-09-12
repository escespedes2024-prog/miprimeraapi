import 'package:mysql_client/mysql_client.dart';

class ServiceProveedor {
  final MySQLConnection connection;

  ServiceProveedor(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, nombre, telefono, email, direccion, activo FROM proveedores ORDER BY id DESC',
    );
  }
}