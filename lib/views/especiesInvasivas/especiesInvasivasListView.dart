import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/especiesInvasivas.dart';
import '../../services/especiesInvasivasService.dart';
import '../../widgets/base_view.dart';

class EspeciesInvasivasListView extends StatefulWidget {
  const EspeciesInvasivasListView({super.key});

  @override
  State<EspeciesInvasivasListView> createState() => _EspeciesInvasivasListViewState();
}

class _EspeciesInvasivasListViewState extends State<EspeciesInvasivasListView> {
  final EspeciesInvasivasService _especiesService = EspeciesInvasivasService();

  late Future<List<EspeciesInvasivasModel>> _futureEspecies;

  @override
  void initState() {
    super.initState();
    _futureEspecies = _especiesService.getEspeciesInvasivas();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Especies Invasivas',
      body: FutureBuilder<List<EspeciesInvasivasModel>>(
        future: _futureEspecies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final especies = snapshot.data!;
            return ListView.builder(
              itemCount: especies.length,
              itemBuilder: (context, index) {
                final especie = especies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/especies-invasivas/${especie.id}');
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              especie.nombre.isNotEmpty ? especie.nombre : 'Sin nombre',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            if (especie.imagen.isNotEmpty)
                              Image.network(
                                especie.imagen,
                                height: 150,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox(
                                    height: 150,
                                    child: Center(
                                      child: Text('[imagen no disponible]'),
                                    ),
                                  );
                                },
                              ),
                            const SizedBox(height: 8.0),
                            Text(
                              especie.nombreComun.isNotEmpty
                                  ? especie.nombreComun
                                  : 'Sin nombre común',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Riesgo: ${especie.nivelRiesgo}',
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
