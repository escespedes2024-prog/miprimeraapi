import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/service_estado_venta.dart';

Router EstadoVentaRoutes(MySQLConnection connection) {
  final router = Router();
  
  final service = ServiceEstadoVenta(connection);
  
  router.get('/api/estados-venta', (Request request) async {
    final resultado = await service.obtenerTodos();
    
    final estados = resultado.rows.map((row){
      return {
        'id': row.colAt(0),
        'nombre': row.colAt(1),
        'descripcion': row.colAt(2),
        'activo': row.colAt(3),
      };
    }).toList();
    
    return Response.ok(
      jsonEncode(estados),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

return router;
}