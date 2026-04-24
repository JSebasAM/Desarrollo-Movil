class MapasModel {
  int id;
  String nombre;
  String descripcion;
  String departamento;
  String imagen;
  String url;

  MapasModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.departamento,
    required this.imagen,
    required this.url,
  });

  factory MapasModel.fromJson(Map<String, dynamic> json) {
    return MapasModel(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      departamento: json['departamento'],
      imagen: json['imagen'] ?? '',
      url: json['url'] ?? '',
    );
  }
}