import 'package:mysql_client/mysql_client.dart';

class VentaSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO ventas (cliente_id, total, estado) VALUES (:cliente_id, :total, :estado)',
      {
        'cliente_id': 1,
        'total': 0.00,
        'estado':'pendiente',
      },
    );

    await connection.execute(
      'INSERT INTO ventas (cliente_id, total, estado) VALUES (:cliente_id, :total, :estado)',
      {
        'cliente_id': 2,
        'total': 0.00,
        'estado':'pagada',
      },
    );

    print('Ventas Creadas');
  }
}