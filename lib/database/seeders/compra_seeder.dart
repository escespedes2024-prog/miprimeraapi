import 'package:mysql_client/mysql_client.dart';

class CompraSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO compras (proveedor_id, estado_compra_id, total) VALUES (:proveedor_id, :estado_compra_id, :total)',
      {
        'proveedor_id': 1,
        'estado_compra_id': 1,
        'total': 33.50,
      },
    );

    await connection.execute(
      'INSERT INTO compras (proveedor_id, estado_compra_id, total) VALUES (:proveedor_id, :estado_compra_id, :total)',
      {
        'proveedor_id': 2,
        'estado_compra_id': 2,
        'total': 25.00,
      },
    );

    print('Compras Creadas');
  }
}