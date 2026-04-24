class ComunidadNativa {
  final String nombre;
  final String descripcion;
  final String lenguaje;
  final String imagen;

  ComunidadNativa({
    required this.nombre,
    required this.descripcion,
    required this.lenguaje,
    required this.imagen,
  });

  factory ComunidadNativa.fromJson(Map<String, dynamic> json) {
    List images = json['images'] ?? [];

    return ComunidadNativa(
      nombre: json['name'] ?? '',
      descripcion: json['description'] ?? '',
      lenguaje: json['languages'] ?? '',
      imagen: images.isNotEmpty ? images[0] : '',
    );
  }
}