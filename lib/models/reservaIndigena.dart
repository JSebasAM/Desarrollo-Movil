import 'package:desarollo_movil/models/comunidadNativa.dart';

class ReservasIndigenasModel {
  int id;
  String nombre;
  String departamento;
  String municipio;
  String procedencia;
  ComunidadNativa comunidad;
  

  ReservasIndigenasModel({
    required this.id,
    required this.nombre,
    required this.procedencia,
    required this.comunidad,
    required this.departamento,
    required this.municipio,
  });

  factory ReservasIndigenasModel.fromJson(Map<String, dynamic> json) {
    return ReservasIndigenasModel(
      id: json['id'],
      nombre: json['nombre'],
      procedencia: json['procedencia'],
      departamento: json['departamento'],
      municipio: json['municipio'],
      comunidad: ComunidadNativa.fromJson(json['comunidad']),

    );
  }

}