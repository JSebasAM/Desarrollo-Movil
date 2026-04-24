class MapasModel {
  int id;
  String nombre;
  String descripcion;
  String imagen;
  String url;

  MapasModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
    required this.url,
  });

  factory MapasModel.fromJson(Map<String, dynamic> json) {
  return MapasModel(
    id: json['id'].toInt(),
    nombre: json['name'].toString(),
    descripcion:  json['description'].toString(),
    imagen: json['urlImages'][0],
    url: json['urlSource'].toString(),
  );
}
}