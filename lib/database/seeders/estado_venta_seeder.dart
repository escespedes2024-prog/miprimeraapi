import 'package:mysql_client/mysql_client.dart';

class EstadoVentaSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO estados_venta (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'pendiente',
        'descripcion':'Venta sin pagar',
      },
    );

    await connection.execute(
      'INSERT INTO estados_venta (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'pagada',
        'descripcion':'Venta pagada',
      },
    );

    await connection.execute(
      'INSERT INTO estados_venta (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'cancelada',
        'descripcion':'Venta cancelada',
      },
    );

    print('Estados de Venta Creados');
  }
}