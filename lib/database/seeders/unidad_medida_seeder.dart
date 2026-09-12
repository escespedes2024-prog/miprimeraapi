import 'package:mysql_client/mysql_client.dart';

class UnidadMedidaSeeder {
  static Future<void> run(MySQLConnection connection) async{
    await connection.execute(
      'INSERT INTO unidades_medida (nombre, abreviatura) VALUES (:nombre, :abreviatura)',
      {
        'nombre':'Kilogramo',
        'abreviatura':'kg',
      },
    );

    await connection.execute(
      'INSERT INTO unidades_medida (nombre, abreviatura) VALUES (:nombre, :abreviatura)',
      {
        'nombre':'Unidad',
        'abreviatura':'und',
      },
    );

    print('Unidades de Medida Creadas');
  }
}