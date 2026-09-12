import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';
import '../services/service_pago.dart';

Router PagoRoutes(MySQLConnection connection) {
  final router = Router();
  
  final service = ServicePago(connection);
  
  router.get('/api/pagos', (Request request) async {
    final resultado = await service.obtenerTodos();
    
    final pagos = resultado.rows.map((row){
      return {
        'id': row.colAt(0),
        'venta_id': row.colAt(1),
        'metodo_pago_id': row.colAt(2),
        'monto': row.colAt(3),
        'fecha': row.colAt(4),
        'referencia': row.colAt(5),
      };
    }).toList();
    
    return Response.ok(
      jsonEncode(pagos),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  });

return router;
}