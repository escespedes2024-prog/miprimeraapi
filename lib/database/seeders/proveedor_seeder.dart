  import 'package:mysql_client/mysql_client.dart';

class ProveedorSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO proveedores (nombre, telefono, email, direccion) VALUES (:nombre, :telefono, :email, :direccion)',
      {
        'nombre':'Distribuidora Central',
        'telefono':'55512345',
        'email':'ventas@central.com',
        'direccion':'Av. Principal 123',
      },
    );

    await connection.execute(
      'INSERT INTO proveedores (nombre, telefono, email, direccion) VALUES (:nombre, :telefono, :email, :direccion)',
      {
        'nombre':'Importadora del Sur',
        'telefono':'55567890',
        'email':'contacto@delsur.com',
        'direccion':'Calle Secundaria 456',
      },
    );

    print('Proveedores Creados');
  }
}