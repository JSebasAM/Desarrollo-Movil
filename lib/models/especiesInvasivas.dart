class EspeciesInvasivasModel {
  int id;
  String nombre;
  String nombreCientifico;
  String nombreComun;
  String impacto;
  String manage;
  int nivelRiesgo;
  String imagen;

  EspeciesInvasivasModel({
    required this.id,
    required this.nombre,
    required this.nombreCientifico,
    required this.nombreComun,
    required this.impacto,
    required this.manage,
    required this.nivelRiesgo,
    required this.imagen,
  });

  factory EspeciesInvasivasModel.fromJson(Map<String, dynamic> json) {
    return EspeciesInvasivasModel(
      id: json['id'],
      nombre: json['nombre'],
      nombreCientifico: json['nombre_cientifico'],
      nombreComun: json['nombre_comun'],
      impacto: json['impacto'],
      manage: json['manage'],
      nivelRiesgo: json['nivel_riesgo'],
      imagen: json['imagen'] ?? '',
    );
  }
}