import 'package:flutter/material.dart';

import '../../models/reservaIndigena.dart';
import '../../services/reservasIndigenasService.dart';
import '../../widgets/base_view.dart';

class DetallesReservasIndigenas extends StatefulWidget {
  const DetallesReservasIndigenas({super.key, required this.id});

  final int id;

  @override
  State<DetallesReservasIndigenas> createState() => _DetallesReservasIndigenasState();
}

class _DetallesReservasIndigenasState extends State<DetallesReservasIndigenas> {
  final ReservasIndigenasService _reservasService = ReservasIndigenasService();

  late Future<ReservasIndigenasModel> _futureReserva;

  @override
  void initState() {
    super.initState();
    _futureReserva = _reservasService.getReservaIndigenaById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Detalle Reserva Indígena',
      body: FutureBuilder<ReservasIndigenasModel>(
        future: _futureReserva,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final reserva = snapshot.data!;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      reserva.nombre.isNotEmpty ? reserva.nombre : 'Sin nombre',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Código: ${reserva.codigo.isNotEmpty ? reserva.codigo : 'Sin código'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Procedimiento: ${reserva.tipoProcedimiento.isNotEmpty ? reserva.tipoProcedimiento : 'Sin procedimiento'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Acto administrativo: ${reserva.tipoActoAdministrativo.isNotEmpty ? reserva.tipoActoAdministrativo : 'Sin acto'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Número de acto: ${reserva.numeroActoAdministrativo.isNotEmpty ? reserva.numeroActoAdministrativo : 'Sin número'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Fecha: ${reserva.fechaActoAdministrativo.isNotEmpty ? reserva.fechaActoAdministrativo : 'Sin fecha'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Departamento: ${reserva.departamento.isNotEmpty ? reserva.departamento : 'Sin departamento'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Municipio: ${reserva.municipio.isNotEmpty ? reserva.municipio : 'Sin municipio'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      reserva.comunidad.nombre.isNotEmpty
                          ? reserva.comunidad.nombre
                          : 'Sin comunidad',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      reserva.comunidad.descripcion.isNotEmpty
                          ? reserva.comunidad.descripcion
                          : 'Sin descripción de la comunidad',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
