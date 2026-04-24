import 'package:flutter/material.dart';

import '../../models/especiesInvasivas.dart';
import '../../services/especiesInvasivasService.dart';
import '../../widgets/base_view.dart';

class DetallesEspeciesInvasivas extends StatefulWidget {
  const DetallesEspeciesInvasivas({super.key, required this.id});

  final int id;

  @override
  State<DetallesEspeciesInvasivas> createState() => _DetallesEspeciesInvasivasState();
}

class _DetallesEspeciesInvasivasState extends State<DetallesEspeciesInvasivas> {
  final EspeciesInvasivasService _especiesService = EspeciesInvasivasService();

  late Future<EspeciesInvasivasModel> _futureEspecie;

  @override
  void initState() {
    super.initState();
    _futureEspecie = _especiesService.getEspecieInvasivaById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Detalle Especie Invasiva',
      body: FutureBuilder<EspeciesInvasivasModel>(
        future: _futureEspecie,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final especie = snapshot.data!;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (especie.imagen.isNotEmpty) ...[
                      Image.network(
                        especie.imagen,
                        height: 180,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            height: 180,
                            child: Center(
                              child: Text('[imagen no disponible]'),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                    ],
                    Text(
                      especie.nombre.isNotEmpty ? especie.nombre : 'Sin nombre',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Nombre científico: ${especie.nombreCientifico.isNotEmpty ? especie.nombreCientifico : 'Sin dato'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Nombre común: ${especie.nombreComun.isNotEmpty ? especie.nombreComun : 'Sin dato'}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Nivel de riesgo: ${especie.nivelRiesgo}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      especie.impacto.isNotEmpty ? especie.impacto : 'Sin impacto registrado',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      especie.manage.isNotEmpty ? especie.manage : 'Sin plan de manejo',
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
