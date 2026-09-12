import 'package:mysql_client/mysql_client.dart';

class DetalleVentaSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO detalle_venta (venta_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (:venta_id, :producto_id, :cantidad, :precio_unitario, :subtotal)',
      {
        'venta_id': 1,
        'producto_id': 1,
        'cantidad': 2,
        'precio_unitario': 12.50,
        'subtotal': 25.00,
      },
    );

    await connection.execute(
      'INSERT INTO detalle_venta (venta_id, producto_id, cantidad, precio_unitario, subtotal) VALUES (:venta_id, :producto_id, :cantidad, :precio_unitario, :subtotal)',
      {
        'venta_id': 1,
        'producto_id': 2,
        'cantidad': 1,
        'precio_unitario': 8.50,
        'subtotal': 8.50,
      },
    );

    print('Detalle de Ventas Creados');
  }
}