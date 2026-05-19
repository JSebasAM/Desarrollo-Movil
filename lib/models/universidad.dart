class Universidad {
  final String id;
  final String nit;
  final String nombre;
  final String direccion;
  final String telefono;
  final String paginaWeb;

  Universidad({
    this.id = '',
    required this.nit,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.paginaWeb,
  });

  factory Universidad.fromMap(Map<String, dynamic> data) {
    return Universidad(
      id: data['id'] ?? '',
      nit: (data['nit'] ?? '').toString(),
      nombre: (data['nombre'] ?? '').toString(),
      direccion: (data['direccion'] ?? '').toString(),
      telefono: (data['telefono'] ?? '').toString(),
      paginaWeb: (data['pagina_web'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nit': nit,
      'nombre': nombre,
      'direccion': direccion,
      'telefono': telefono,
      'pagina_web': paginaWeb,
    };
  }
}
