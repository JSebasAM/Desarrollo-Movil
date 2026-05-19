import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_drawer.dart'; // Importa el Drawer personalizado

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const BaseView({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

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
      drawer: const CustomDrawer(),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
