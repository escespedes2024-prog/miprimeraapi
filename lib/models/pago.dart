class Pago {
  final int id;
  final int ventaId;
  final int metodoPagoId;
  final double monto;
  final String fecha;
  final String? referencia;

  Pago({
    required this.id,
    required this.ventaId,
    required this.metodoPagoId,
    required this.monto,
    required this.fecha,
    this.referencia,
  });

  factory Pago.fromMap(Map<String, dynamic> map) {
    return Pago(
      id: map['id'] as int,
      ventaId: map['venta_id'] as int,
      metodoPagoId: map['metodo_pago_id'] as int,
      monto: double.parse(map['monto'].toString()),
      fecha: map['fecha'].toString(),
      referencia: map['referencia'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'venta_id': ventaId,
      'metodo_pago_id': metodoPagoId,
      'monto': monto,
      'fecha': fecha,
      'referencia': referencia,
    };
  }
}