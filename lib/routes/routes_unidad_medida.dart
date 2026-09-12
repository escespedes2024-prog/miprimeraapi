import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/service_unidad_medida.dart';

Router UnidadMedidaRoutes(MySQLConnection connection) {
  final router = Router();
  
  final service = ServiceUnidadMedida(connection);
  
  router.get('/api/unidades-medida', (Request request) async {
    final resultado = await service.obtenerTodos();
    
    final unidades = resultado.rows.map((row){
      return {
        'id': row.colAt(0),
        'nombre': row.colAt(1),
        'abreviatura': row.colAt(2),
        'activo': row.colAt(3),
      };
    }).toList();
    
    return Response.ok(
      jsonEncode(unidades),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

return router;
}