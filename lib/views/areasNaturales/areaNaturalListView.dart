import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/tiposAreaNatural.dart';
import '../../services/areaNaturalService.dart';
import '../../widgets/base_view.dart';

class Areanaturallistview extends StatefulWidget {
  const Areanaturallistview({super.key});

  @override
  State<Areanaturallistview> createState() => _AreanaturallistviewState();
}

class _AreanaturallistviewState extends State<Areanaturallistview> {
  final AreaNaturalService _areaNaturalService = AreaNaturalService();

  late Future<List<AreaNaturalModel>> _futureAreasNaturales;

  @override
  void initState() {
    super.initState();
    _futureAreasNaturales = _areaNaturalService.getAreasNaturales();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Áreas Naturales',
      body: FutureBuilder<List<AreaNaturalModel>>(
        future: _futureAreasNaturales,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final areasNaturales = snapshot.data!;
            return ListView.builder(
              itemCount: areasNaturales.length,
              itemBuilder: (context, index) {
                final areaNatural = areasNaturales[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/area-natural/${areaNatural.id}');
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
                                    areaNatural.nombre,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
