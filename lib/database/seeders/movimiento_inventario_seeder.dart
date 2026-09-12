import 'package:mysql_client/mysql_client.dart';

class MovimientoInventarioSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO movimientos_inventario (producto_id, tipo_movimiento_id, cantidad, referencia) VALUES (:producto_id, :tipo_movimiento_id, :cantidad, :referencia)',
      {
        'producto_id': 1,
        'tipo_movimiento_id': 1,
        'cantidad': 100.00,
        'referencia': 'Compra inicial',
      },
    );

    await connection.execute(
      'INSERT INTO movimientos_inventario (producto_id, tipo_movimiento_id, cantidad, referencia) VALUES (:producto_id, :tipo_movimiento_id, :cantidad, :referencia)',
      {
        'producto_id': 1,
        'tipo_movimiento_id': 2,
        'cantidad': 10.00,
        'referencia': 'Venta',
      },
    );

    print('Movimientos de Inventario Creados');
  }
}