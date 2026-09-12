import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/service_detalle_compra.dart';

Router DetalleCompraRoutes(MySQLConnection connection) {
  final router = Router();
  
  final service = ServiceDetalleCompra(connection);
  
  router.get('/api/detalle-compras', (Request request) async {
    final resultado = await service.obtenerTodos();
    
    final detalles = resultado.rows.map((row){
      return {
        'id': row.colAt(0),
        'compra_id': row.colAt(1),
        'producto_id': row.colAt(2),
        'cantidad': row.colAt(3),
        'precio_unitario': row.colAt(4),
        'subtotal': row.colAt(5),
      };
    }).toList();
    
    return Response.ok(
      jsonEncode(detalles),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

return router;
}