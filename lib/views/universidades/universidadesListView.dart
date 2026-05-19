import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/universidad.dart';
import '../../services/firebase_service.dart';
import '../../widgets/base_view.dart';

class UniversidadesListView extends StatefulWidget {
  const UniversidadesListView({super.key});

  @override
  State<UniversidadesListView> createState() => _UniversidadesListViewState();
}

class _UniversidadesListViewState extends State<UniversidadesListView> {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Universidades',
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/universidades/nueva'),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _firebaseService.streamUniversidades(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final universidades =
              snapshot.data!.map((json) => Universidad.fromMap(json)).toList();

          if (universidades.isEmpty) {
            return const Center(
              child: Text('No hay universidades disponibles.'),
            );
          }

          return ListView.builder(
            itemCount: universidades.length,
            itemBuilder: (context, index) {
              final universidad = universidades[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          universidad.nombre.isNotEmpty ? universidad.nombre : 'Sin nombre',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'NIT: ${universidad.nit.isNotEmpty ? universidad.nit : "Sin NIT"}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          universidad.direccion.isNotEmpty
                              ? universidad.direccion
                              : 'Sin dirección',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          universidad.telefono.isNotEmpty
                              ? universidad.telefono
                              : 'Sin teléfono',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          universidad.paginaWeb.isNotEmpty
                              ? universidad.paginaWeb
                              : 'Sin página web',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
