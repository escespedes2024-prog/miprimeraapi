import 'package:miprimeraapi/database/database.dart';
import 'package:miprimeraapi/database/seeders/categoria_seeder.dart';
import 'package:miprimeraapi/database/seeders/cliente_seeder.dart';
import 'package:miprimeraapi/database/seeders/compra_seeder.dart';
import 'package:miprimeraapi/database/seeders/detalle_compra_seeder.dart';
import 'package:miprimeraapi/database/seeders/detalle_venta_seeder.dart';
import 'package:miprimeraapi/database/seeders/estado_compra_seeder.dart';
import 'package:miprimeraapi/database/seeders/estado_venta_seeder.dart';
import 'package:miprimeraapi/database/seeders/metodo_pago_seeder.dart';
import 'package:miprimeraapi/database/seeders/movimiento_inventario_seeder.dart';
import 'package:miprimeraapi/database/seeders/pago_seeder.dart';
import 'package:miprimeraapi/database/seeders/producto_seeder.dart';
import 'package:miprimeraapi/database/seeders/proveedor_seeder.dart';
import 'package:miprimeraapi/database/seeders/tipo_movimiento_seeder.dart';
import 'package:miprimeraapi/database/seeders/unidad_medida_seeder.dart';
import 'package:miprimeraapi/database/seeders/venta_seeder.dart';

Future<void> main() async{
  print('iniciando seeders....');

  final connection = await Database.connet();

  try {
    await ProductoSeeder.run(connection);
    await ClienteSeeder.run(connection);
    await VentaSeeder.run(connection);
    await DetalleVentaSeeder.run(connection);
    await ProveedorSeeder.run(connection);
    await CategoriaSeeder.run(connection);
    await UnidadMedidaSeeder.run(connection);
    await MetodoPagoSeeder.run(connection);
    await EstadoVentaSeeder.run(connection);
    await EstadoCompraSeeder.run(connection);
    await TipoMovimientoSeeder.run(connection);
    await CompraSeeder.run(connection);
    await DetalleCompraSeeder.run(connection);
    await PagoSeeder.run(connection);
    await MovimientoInventarioSeeder.run(connection);

    print('Seeders ejecutandose correctamente. ');
  }catch(e){
    print('Error Ejecutandose seeders: $e');
  }finally {
    await connection.close();
  }
}