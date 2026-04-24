import 'package:desarollo_movil/models/comunidadNativa.dart';

class ReservasIndigenasModel {
  int id;
  String nombre;
  String codigo;
  String tipoProcedimiento;
  String tipoActoAdministrativo;
  String numeroActoAdministrativo;
  String fechaActoAdministrativo;
  ComunidadNativa comunidad;
  String departamento;
  String municipio;
  

  ReservasIndigenasModel({
    required this.id,
    required this.nombre,
    required this.codigo,
    required this.tipoProcedimiento,
    required this.tipoActoAdministrativo,
    required this.numeroActoAdministrativo,
    required this.fechaActoAdministrativo,
    required this.comunidad,
    required this.departamento,
    required this.municipio,
  });

  factory ReservasIndigenasModel.fromJson(Map<String, dynamic> json) {
    final nativeCommunity = json['nativeCommunity'];
    final department = json['department'];
    final city = json['city'];

    return ReservasIndigenasModel(
      id: json['id'] ?? 0,
      nombre: (json['name'] ?? json['nombre'] ?? '').toString(),
      codigo: (json['code'] ?? '').toString(),
      tipoProcedimiento: (json['procedureType'] ?? '').toString(),
      tipoActoAdministrativo: (json['administrativeActType'] ?? '').toString(),
      numeroActoAdministrativo: (json['administrativeActNumber'] ?? '').toString(),
      fechaActoAdministrativo: (json['administrativeActDate'] ?? '').toString(),
      comunidad: nativeCommunity is Map<String, dynamic>
          ? ComunidadNativa.fromJson(nativeCommunity)
          : ComunidadNativa(nombre: '', descripcion: '', lenguaje: '', imagen: ''),
      departamento: department is Map<String, dynamic>
          ? (department['name'] ?? '').toString()
          : (json['departamento'] ?? '').toString(),
      municipio: city is Map<String, dynamic>
          ? (city['name'] ?? '').toString()
          : (json['municipio'] ?? '').toString(),

    );
  }

}