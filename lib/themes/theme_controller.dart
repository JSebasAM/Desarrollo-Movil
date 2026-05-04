import 'package:flutter/material.dart';

/// Control global y sencillo para el modo de tema usando ValueNotifier.
class ThemeController {
  // Valor inicial: light
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

  static bool get isDark => themeMode.value == ThemeMode.dark;

  static void toggle() {
    themeMode.value = isDark ? ThemeMode.light : ThemeMode.dark;
  }
}
