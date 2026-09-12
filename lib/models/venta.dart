class Venta {
  final int id;
  final int clienteId;
  final String fecha;
  final double total;
  final String estado;

  Venta({
    required this.id,
    required this.clienteId,
    required this.fecha,
    required this.total,
    required this.estado,
  });

  factory Venta.fromMap(Map<String, dynamic> map) {
    return Venta(
      id: map['id'] as int,
      clienteId: map['cliente_id'] as int,
      fecha: map['fecha'].toString(),
      total: double.parse(map['total'].toString()),
      estado: map['estado'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cliente_id': clienteId,
      'fecha': fecha,
      'total': total,
      'estado': estado,
    };
  }
}