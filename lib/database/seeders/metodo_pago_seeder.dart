import 'package:mysql_client/mysql_client.dart';

class MetodoPagoSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO metodos_pago (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'Efectivo',
        'descripcion':'Pago en efectivo',
      },
    );

    await connection.execute(
      'INSERT INTO metodos_pago (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'Tarjeta',
        'descripcion':'Pago con tarjeta de credito o debito',
      },
    );

    print('Metodos de Pago Creados');
  }
}