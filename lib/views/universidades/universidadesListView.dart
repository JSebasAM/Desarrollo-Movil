import 'package:desarollo_movil/services/firebase_service.dart';
import 'package:flutter/material.dart';

import '../../widgets/base_view.dart';

class UniversidadesListView extends StatefulWidget {
  const UniversidadesListView({super.key});

  @override
  State<UniversidadesListView> createState() => _UniversidadesListViewState();
}

class _UniversidadesListViewState extends State<UniversidadesListView> {

  final FirebaseService _firebaseService = FirebaseService();
  late Future<List<Map<String, dynamic>>> _futureUniversidades;

  @override
  void initState() {
    super.initState();
    _futureUniversidades = _firebaseService.getUniversidades();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Universidades',
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureUniversidades,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay universidades disponibles.'));
          }
          final universidades = snapshot.data!;
          return ListView.builder(
            itemCount: universidades.length,
            itemBuilder: (context, index) {
              final universidad = universidades[index];
              return ListTile(
                title: Text(universidad['nombre'] as String),
                subtitle: Text(universidad['direccion'] as String),
              );
            },
          );
        },
      ),
    );
  }
}
