import 'package:flutter/material.dart';

import '../../models/universidad.dart';
import '../../services/firebase_service.dart';
import '../../widgets/base_view.dart';

class NuevaUniversidadScreen extends StatefulWidget {
  const NuevaUniversidadScreen({super.key});

  @override
  State<NuevaUniversidadScreen> createState() => _NuevaUniversidadScreenState();
}

class _NuevaUniversidadScreenState extends State<NuevaUniversidadScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firebaseService = FirebaseService();
  final _nitController = TextEditingController();
  final _nombreController = TextEditingController();
  final _direccionController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _paginaWebController = TextEditingController();
  bool _guardando = false;

  @override
  void dispose() {
    _nitController.dispose();
    _nombreController.dispose();
    _direccionController.dispose();
    _telefonoController.dispose();
    _paginaWebController.dispose();
    super.dispose();
  }

  String? _validarUrl(String? value) {
    if (value == null || value.isEmpty) return 'La página web es obligatoria';
    final uri = Uri.tryParse(value);
    if (uri == null || !uri.hasScheme || (!uri.isScheme('http') && !uri.isScheme('https'))) {
      return 'Ingrese una URL válida (http/https)';
    }
    return null;
  }

  Future<void> _guardar() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _guardando = true);

    try {
      final universidad = Universidad(
        nit: _nitController.text.trim(),
        nombre: _nombreController.text.trim(),
        direccion: _direccionController.text.trim(),
        telefono: _telefonoController.text.trim(),
        paginaWeb: _paginaWebController.text.trim(),
      );

      await _firebaseService.addUniversidad(universidad.toMap());

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Universidad guardada correctamente')),
      );
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _guardando = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Nueva Universidad',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nitController,
                decoration: const InputDecoration(
                  labelText: 'NIT',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'El NIT es obligatorio' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'El nombre es obligatorio' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'La dirección es obligatoria' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'El teléfono es obligatorio' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _paginaWebController,
                decoration: const InputDecoration(
                  labelText: 'Página web',
                  hintText: 'https://ejemplo.com',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.url,
                validator: _validarUrl,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _guardando ? null : _guardar,
                  child: _guardando
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
