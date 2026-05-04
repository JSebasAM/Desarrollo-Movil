import 'package:flutter/material.dart';

class AppTheme {
  //! tema claro
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 29, 23, 202), // Color semilla
        brightness: Brightness.light, // Tema claro
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 20, 165, 97), // Color del AppBar
        titleTextStyle: TextStyle(
          color: Colors.white, // Texto blanco para el AppBar
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: Colors.white, // Fondo del Drawer
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black87), // Estilo de texto
        bodyMedium: TextStyle(color: Colors.black87),
      ),
    );
  }

  //! tema oscuro, no muy intenso
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 29, 23, 202),
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF121317),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF184E3A), // tono oscuro pero suave
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
        backgroundColor: Color(0xFF1F1F1F), // fondo menos intenso que negro
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white70),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
    );
  }
}
