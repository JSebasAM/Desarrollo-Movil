import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/reservaIndigena.dart';
import '../../services/reservasIndigenasService.dart';
import '../../widgets/base_view.dart';

class ReservasIndigenasListView extends StatefulWidget {
  const ReservasIndigenasListView({super.key});

  @override
  State<ReservasIndigenasListView> createState() => _ReservasIndigenasListViewState();
}

class _ReservasIndigenasListViewState extends State<ReservasIndigenasListView> {
  final ReservasIndigenasService _reservasService = ReservasIndigenasService();

  late Future<List<ReservasIndigenasModel>> _futureReservas;

  @override
  void initState() {
    super.initState();
    _futureReservas = _reservasService.getReservasIndigenas();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Reservas Indígenas',
      body: FutureBuilder<List<ReservasIndigenasModel>>(
        future: _futureReservas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final reservas = snapshot.data!;
            return ListView.builder(
              itemCount: reservas.length,
              itemBuilder: (context, index) {
                final reserva = reservas[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/reservas-indigenas/${reserva.id}');
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              reserva.nombre.isNotEmpty ? reserva.nombre : 'Sin nombre',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              reserva.tipoProcedimiento.isNotEmpty
                                  ? reserva.tipoProcedimiento
                                  : 'Sin procedimiento',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${reserva.municipio} - ${reserva.departamento}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
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
