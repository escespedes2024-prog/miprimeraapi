import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/service_tipo_movimiento.dart';

Router TipoMovimientoRoutes(MySQLConnection connection) {
  final router = Router();
  
  final service = ServiceTipoMovimiento(connection);
  
  router.get('/api/tipos-movimiento', (Request request) async {
    final resultado = await service.obtenerTodos();
    
    final tipos = resultado.rows.map((row){
      return {
        'id': row.colAt(0),
        'nombre': row.colAt(1),
        'descripcion': row.colAt(2),
        'signo': row.colAt(3),
        'activo': row.colAt(4),
      };
    }).toList();
    
    return Response.ok(
      jsonEncode(tipos),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

return router;
}