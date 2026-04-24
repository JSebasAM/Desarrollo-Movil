class AreaNaturalModel {
  int id;
  String nombre;
  String descripcion;

  AreaNaturalModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
  });

  factory AreaNaturalModel.fromJson(Map<String, dynamic> json) {
    return AreaNaturalModel(
      id: json['id'] ?? 0,
      nombre: (json['nombre'] ?? json['name'] ?? '').toString(),
      descripcion: (json['descripcion'] ?? json['description'] ?? '').toString(),
    );
  }
}