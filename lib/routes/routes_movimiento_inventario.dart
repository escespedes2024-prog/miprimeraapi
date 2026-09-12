import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/service_movimiento_inventario.dart';

Router MovimientoInventarioRoutes(MySQLConnection connection) {
  final router = Router();
  
  final service = ServiceMovimientoInventario(connection);
  
  router.get('/api/movimientos-inventario', (Request request) async {
    final resultado = await service.obtenerTodos();
    
    final movimientos = resultado.rows.map((row){
      return {
        'id': row.colAt(0),
        'producto_id': row.colAt(1),
        'tipo_movimiento_id': row.colAt(2),
        'cantidad': row.colAt(3),
        'referencia': row.colAt(4),
        'fecha': row.colAt(5),
      };
    }).toList();
    
    return Response.ok(
      jsonEncode(movimientos),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

return router;
}