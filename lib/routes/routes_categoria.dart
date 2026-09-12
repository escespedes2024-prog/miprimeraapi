import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/service_categoria.dart';

Router CategoriaRoutes(MySQLConnection connection) {
  final router = Router();
  
  final service = ServiceCategoria(connection);
  
  router.get('/api/categorias', (Request request) async {
    final resultado = await service.obtenerTodos();
    
    final categorias = resultado.rows.map((row){
      return {
        'id': row.colAt(0),
        'nombre': row.colAt(1),
        'descripcion': row.colAt(2),
        'activo': row.colAt(3),
      };
    }).toList();
    
    return Response.ok(
      jsonEncode(categorias),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

return router;
}