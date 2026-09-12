import 'package:mysql_client/mysql_client.dart';

class CategoriaSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO categorias (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'Abarrotes',
        'descripcion':'Productos de consumo básico',
      },
    );

    await connection.execute(
      'INSERT INTO categorias (nombre, descripcion) VALUES (:nombre, :descripcion)',
      {
        'nombre':'Lacteos',
        'descripcion':'Productos derivados de la leche',
      },
    );

    print('Categorias Creadas');
  }
}