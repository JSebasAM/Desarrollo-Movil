import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_drawer.dart'; // Importa el Drawer personalizado

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseView({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final canGoBack = context.canPop();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: canGoBack
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              )
            : null,
      ),
      drawer: const CustomDrawer(), // Drawer persistente para todas las vistas
      body: body,
    );
  }
}
