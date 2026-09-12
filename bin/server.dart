import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:miprimeraapi/database/database.dart';
import 'package:miprimeraapi/routes/routes_categoria.dart';
import 'package:miprimeraapi/routes/routes_cliente.dart';
import 'package:miprimeraapi/routes/routes_compra.dart';
import 'package:miprimeraapi/routes/routes_detalle_compra.dart';
import 'package:miprimeraapi/routes/routes_detalle_venta.dart';
import 'package:miprimeraapi/routes/routes_estado_compra.dart';
import 'package:miprimeraapi/routes/routes_estado_venta.dart';
import 'package:miprimeraapi/routes/routes_metodo_pago.dart';
import 'package:miprimeraapi/routes/routes_movimiento_inventario.dart';
import 'package:miprimeraapi/routes/routes_pago.dart';
import 'package:miprimeraapi/routes/routes_producto.dart';
import 'package:miprimeraapi/routes/routes_proveedor.dart';
import 'package:miprimeraapi/routes/routes_tipo_movimiento.dart';
import 'package:miprimeraapi/routes/routes_unidad_medida.dart';
import 'package:miprimeraapi/routes/routes_venta.dart';

Future<void> main(List<String> args) async {
  final connection = await Database.connet();

  print('Conectado a MySQL.');

  final router = Router();

  router.get('/', (Request request) {
    return Response.ok(
      'API Dart funcionando correctamente\n',
    );
  });

  router.get('/docs', (Request request) async {
    final file = File('redoc-static.html');
    if (await file.exists()) {
      return Response.ok(
        await file.readAsString(),
        headers: {'Content-Type': 'text/html'},
      );
    }
    return Response.notFound('Archivo de documentación no encontrado.');
  });

  final productoRouter = ProductoRoutes(connection);
  final clienteRouter = ClienteRoutes(connection);
  final ventaRouter = VentaRoutes(connection);
  final detalleVentaRouter = DetalleVentaRoutes(connection);
  final proveedorRouter = ProveedorRoutes(connection);
  final categoriaRouter = CategoriaRoutes(connection);
  final unidadMedidaRouter = UnidadMedidaRoutes(connection);
  final metodoPagoRouter = MetodoPagoRoutes(connection);
  final estadoVentaRouter = EstadoVentaRoutes(connection);
  final estadoCompraRouter = EstadoCompraRoutes(connection);
  final tipoMovimientoRouter = TipoMovimientoRoutes(connection);
  final compraRouter = CompraRoutes(connection);
  final detalleCompraRouter = DetalleCompraRoutes(connection);
  final pagoRouter = PagoRoutes(connection);
  final movimientoInventarioRouter = MovimientoInventarioRoutes(connection);

  router.mount('/', productoRouter.call);
  router.mount('/', clienteRouter.call);
  router.mount('/', ventaRouter.call);
  router.mount('/', detalleVentaRouter.call);
  router.mount('/', proveedorRouter.call);
  router.mount('/', categoriaRouter.call);
  router.mount('/', unidadMedidaRouter.call);
  router.mount('/', metodoPagoRouter.call);
  router.mount('/', estadoVentaRouter.call);
  router.mount('/', estadoCompraRouter.call);
  router.mount('/', tipoMovimientoRouter.call);
  router.mount('/', compraRouter.call);
  router.mount('/', detalleCompraRouter.call);
  router.mount('/', pagoRouter.call);
  router.mount('/', movimientoInventarioRouter.call);

  final ip = InternetAddress.anyIPv4;

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final port = int.parse(
    Platform.environment['PORT'] ?? '8080',
  );

  final server = await serve(handler, ip, port);

  print('Servidor ejecutándose en http://${server.address.host}:${server.port}');
}