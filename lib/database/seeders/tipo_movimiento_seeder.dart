import 'package:mysql_client/mysql_client.dart';

class TipoMovimientoSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO tipos_movimiento (nombre, descripcion, signo) VALUES (:nombre, :descripcion, :signo)',
      {
        'nombre':'entrada',
        'descripcion':'Movimiento que aumenta el stock',
        'signo': 1,
      },
    );

    await connection.execute(
      'INSERT INTO tipos_movimiento (nombre, descripcion, signo) VALUES (:nombre, :descripcion, :signo)',
      {
        'nombre':'salida',
        'descripcion':'Movimiento que disminuye el stock',
        'signo': -1,
      },
    );

    print('Tipos de Movimiento Creados');
  }
}