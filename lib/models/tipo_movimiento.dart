class TipoMovimiento {
  final int id;
  final String nombre;
  final String? descripcion;
  final int signo;
  final bool activo;

  TipoMovimiento({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.signo,
    required this.activo,
  });

  factory TipoMovimiento.fromMap(Map<String, dynamic> map) {
    return TipoMovimiento(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      descripcion: map['descripcion'] as String?,
      signo: map['signo'] as int,
      activo: map['activo'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'signo': signo,
      'activo': activo ? 1 : 0,
    };
  }
}