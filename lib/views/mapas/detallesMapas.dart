import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/mapas.dart';
import '../../services/mapasService.dart';
import '../../widgets/base_view.dart';

class DetallesMapas extends StatefulWidget {
  const DetallesMapas({super.key, required this.id});

  final int id;

  @override
  State<DetallesMapas> createState() => _DetallesMapasState();
}

class _DetallesMapasState extends State<DetallesMapas> {
  final MapasService _mapasService = MapasService();

  late Future<MapasModel> _futureMapa;

  @override
  void initState() {
    super.initState();
    _futureMapa = _mapasService.getMapaById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Detalle Mapa',
      body: FutureBuilder<MapasModel>(
        future: _futureMapa,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final mapa = snapshot.data!;

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      mapa.nombre,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),              
                    Text(
                      mapa.descripcion,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Image.network(mapa.imagen, height: 150, fit: BoxFit.cover),
                    Text(
                      mapa.url,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
