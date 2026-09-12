import 'package:mysql_client/mysql_client.dart';

class PagoSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO pagos (venta_id, metodo_pago_id, monto, referencia) VALUES (:venta_id, :metodo_pago_id, :monto, :referencia)',
      {
        'venta_id': 1,
        'metodo_pago_id': 1,
        'monto': 33.50,
        'referencia': 'Pago en efectivo',
      },
    );

    await connection.execute(
      'INSERT INTO pagos (venta_id, metodo_pago_id, monto, referencia) VALUES (:venta_id, :metodo_pago_id, :monto, :referencia)',
      {
        'venta_id': 1,
        'metodo_pago_id': 2,
        'monto': 25.00,
        'referencia': 'Voucher 001',
      },
    );

    print('Pagos Creados');
  }
}