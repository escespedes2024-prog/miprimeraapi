class EstadoCompra {
  final int id;
  final String nombre;
  final String? descripcion;
  final bool activo;

  EstadoCompra({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.activo,
  });

  factory EstadoCompra.fromMap(Map<String, dynamic> map) {
    return EstadoCompra(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      descripcion: map['descripcion'] as String?,
      activo: map['activo'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'activo': activo ? 1 : 0,
    };
  }
}