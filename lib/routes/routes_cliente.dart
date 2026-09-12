import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/service_cliente.dart';

Router ClienteRoutes(MySQLConnection connection) {
  final router = Router();
  
  final service = ServiceCliente(connection);
  
  router.get('/api/clientes', (Request request) async {
    final resultado = await service.obtenerTodos();
    
    final clientes = resultado.rows.map((row){
      return {
        'id': row.colAt(0),
        'nombre': row.colAt(1),
        'apellido': row.colAt(2),
        'telefono': row.colAt(3),
        'email': row.colAt(4),
      };
    }).toList();
    
    return Response.ok(
      jsonEncode(clientes),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

return router;
}