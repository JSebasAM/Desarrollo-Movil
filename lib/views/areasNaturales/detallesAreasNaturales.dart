import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/tiposAreaNatural.dart';
import '../../services/areaNaturalService.dart';
import '../../widgets/base_view.dart';

class Detallesareasnaturales extends StatefulWidget {
  const Detallesareasnaturales({super.key, required this.id});

  final int id;

  @override
  State<Detallesareasnaturales> createState() => _DetallesareasnaturalesState();
}

class _DetallesareasnaturalesState extends State<Detallesareasnaturales> {
  final AreaNaturalService _areaNaturalService = AreaNaturalService();

  late Future<AreaNaturalModel> _futureAreaNatural;

  @override
  void initState() {
    super.initState();
    _futureAreaNatural = _areaNaturalService.getAreaNaturalById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Detalle Área Natural',
      body: FutureBuilder<AreaNaturalModel>(
        future: _futureAreaNatural,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final areaNatural = snapshot.data!;

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        areaNatural.nombre,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                        areaNatural.descripcion,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
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
