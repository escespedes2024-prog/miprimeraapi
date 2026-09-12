import 'package:mysql_client/mysql_client.dart';

class EstadoCompraSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO estados_compra (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'pendiente',
        'descripcion':'Compra en espera',
      },
    );

    await connection.execute(
      'INSERT INTO estados_compra (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'recibida',
        'descripcion':'Compra recibida',
      },
    );

    await connection.execute(
      'INSERT INTO estados_compra (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'cancelada',
        'descripcion':'Compra cancelada',
      },
    );

    print('Estados de Compra Creados');
  }
}