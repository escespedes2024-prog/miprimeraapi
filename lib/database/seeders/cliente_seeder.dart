import 'package:mysql_client/mysql_client.dart';

class ClienteSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO clientes (nombre, apellido, telefono, email) VALUES (:nombre, :apellido, :telefono, :email)',
      {
        'nombre':'Juan',
        'apellido':'Perez',
        'telefono':'12345678',
        'email':'juan@mail.com',
      },
    );

    await connection.execute(
      'INSERT INTO clientes (nombre, apellido, telefono, email) VALUES (:nombre, :apellido, :telefono, :email)',
      {
        'nombre':'Maria',
        'apellido':'Gomez',
        'telefono':'87654321',
        'email':'maria@mail.com',
      },
    );

    print('Clientes Creados');
  }
}