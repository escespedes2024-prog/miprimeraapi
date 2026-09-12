class MovimientoInventario {
  final int id;
  final int productoId;
  final int tipoMovimientoId;
  final double cantidad;
  final String? referencia;
  final String fecha;

  MovimientoInventario({
    required this.id,
    required this.productoId,
    required this.tipoMovimientoId,
    required this.cantidad,
    this.referencia,
    required this.fecha,
  });

  factory MovimientoInventario.fromMap(Map<String, dynamic> map) {
    return MovimientoInventario(
      id: map['id'] as int,
      productoId: map['producto_id'] as int,
      tipoMovimientoId: map['tipo_movimiento_id'] as int,
      cantidad: double.parse(map['cantidad'].toString()),
      referencia: map['referencia'] as String?,
      fecha: map['fecha'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'producto_id': productoId,
      'tipo_movimiento_id': tipoMovimientoId,
      'cantidad': cantidad,
      'referencia': referencia,
      'fecha': fecha,
    };
  }
}