import 'package:mysql_client/mysql_client.dart';

class ServiceCategoria {
  final MySQLConnection connection;

  ServiceCategoria(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, nombre, descripcion, activo FROM categorias ORDER BY id DESC',
    );
  }
}