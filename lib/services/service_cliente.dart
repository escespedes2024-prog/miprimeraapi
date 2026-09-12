import 'package:mysql_client/mysql_client.dart';

class ServiceCliente {
  final MySQLConnection connection;

  ServiceCliente(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, nombre, apellido, telefono, email FROM clientes ORDER BY id DESC',
    );
  }
}