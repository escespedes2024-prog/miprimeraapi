class UnidadMedida {
  final int id;
  final String nombre;
  final String? abreviatura;
  final bool activo;

  UnidadMedida({
    required this.id,
    required this.nombre,
    this.abreviatura,
    required this.activo,
  });

  factory UnidadMedida.fromMap(Map<String, dynamic> map) {
    return UnidadMedida(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      abreviatura: map['abreviatura'] as String?,
      activo: map['activo'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'abreviatura': abreviatura,
      'activo': activo ? 1 : 0,
    };
  }
}