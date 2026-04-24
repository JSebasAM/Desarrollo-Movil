import 'package:flutter/material.dart';
import 'package:desarollo_movil/routes/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'themes/app_theme.dart'; // Importar el tema

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Asegura que Flutter esté inicializado antes de cargar el .env

  try{
    await dotenv.load(fileName: 'lib/config/.env'); // Carga el archivo .env
  } catch (e) {
    print('Error loading .env file: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // build es un metodo que se ejecuta cada vez que se necesita redibujar la pantalla
    //go_router para navegacion
    return MaterialApp.router(
      theme:
          AppTheme.lightTheme, //thema personalizado y permamente en toda la app
      title:
          'Flutter - UCEVA', // Usa el tema personalizado, no se muestra el tema por defecto. esto se visualiza en toda la app
      routerConfig: appRouter, // Usa el router configurado
    );
  }
}
