import 'package:mysql_client/mysql_client.dart';

class ServiceUnidadMedida {
  final MySQLConnection connection;

  ServiceUnidadMedida(this.connection);

  Future<IResultSet> obtenerTodos() async {
    return await connection.execute(
      'SELECT id, nombre, abreviatura, activo FROM unidades_medida ORDER BY id DESC',
    );
  }
}