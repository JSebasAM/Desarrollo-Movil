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
      id: json['id'] ?? 0,
      nombre: (json['name'] ?? json['nombre'] ?? '').toString(),
      nombreCientifico: (json['scientificName'] ?? json['nombre_cientifico'] ?? '').toString(),
      nombreComun: (json['commonNames'] ?? json['nombre_comun'] ?? '').toString(),
      impacto: (json['impact'] ?? '').toString(),
      manage: (json['manage'] ?? '').toString(),
      nivelRiesgo: json['riskLevel'] ?? json['nivel_riesgo'] ?? 0,
      imagen: (json['urlImage'] ?? json['imagen'] ?? '').toString(),
    );
  }
}