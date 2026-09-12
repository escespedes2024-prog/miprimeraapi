class Compra {
  final int id;
  final int proveedorId;
  final int estadoCompraId;
  final String fecha;
  final double total;

  Compra({
    required this.id,
    required this.proveedorId,
    required this.estadoCompraId,
    required this.fecha,
    required this.total,
  });

  factory Compra.fromMap(Map<String, dynamic> map) {
    return Compra(
      id: map['id'] as int,
      proveedorId: map['proveedor_id'] as int,
      estadoCompraId: map['estado_compra_id'] as int,
      fecha: map['fecha'].toString(),
      total: double.parse(map['total'].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'proveedor_id': proveedorId,
      'estado_compra_id': estadoCompraId,
      'fecha': fecha,
      'total': total,
    };
  }
}