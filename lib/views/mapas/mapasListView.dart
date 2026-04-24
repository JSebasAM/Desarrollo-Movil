import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/mapas.dart';
import '../../services/mapasService.dart';
import '../../widgets/base_view.dart';

class Mapaslistview extends StatefulWidget {
  const Mapaslistview({super.key});

  @override
  State<Mapaslistview> createState() => _MapaslistviewState();
}

class _MapaslistviewState extends State<Mapaslistview> {
  final MapasService _mapasService = MapasService();

  late Future<List<MapasModel>> _futureMapas;

  @override
  void initState() {
    super.initState();
    _futureMapas = _mapasService.getMapas();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Áreas Naturales',
      body: FutureBuilder<List<MapasModel>>(
        future: _futureMapas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final mapas = snapshot.data!;
            return ListView.builder(
              itemCount: mapas.length,
              itemBuilder: (context, index) {
                final mapa = mapas[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/mapas/${mapa.id}');
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    mapa.nombre,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Image.network(
                                    mapa.imagen,
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
                                ],
                                
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                );
              }
            );
          } else
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
