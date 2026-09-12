import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/service_metodo_pago.dart';

Router MetodoPagoRoutes(MySQLConnection connection) {
  final router = Router();
  
  final service = ServiceMetodoPago(connection);
  
  router.get('/api/metodos-pago', (Request request) async {
    final resultado = await service.obtenerTodos();
    
    final metodos = resultado.rows.map((row){
      return {
        'id': row.colAt(0),
        'nombre': row.colAt(1),
        'descripcion': row.colAt(2),
        'activo': row.colAt(3),
      };
    }).toList();
    
    return Response.ok(
      jsonEncode(metodos),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

return router;
}