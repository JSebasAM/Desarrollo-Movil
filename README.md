## Desarollo Móvil

Aplicación Flutter orientada a contenido informativo y navegación por módulos, construida con `go_router`, carga de configuración desde `.env` y control de tema global.

### Flujo de publicación

El flujo usado para distribuir nuevas versiones es el siguiente:

**Generar APK → App Distribution → Testers → Instalación → Actualización**

1. Se compila la app en modo release para obtener el APK.
2. El APK se sube a App Distribution.
3. Se agregan o actualizan los testers autorizados.
4. Los testers reciben el acceso e instalan la versión publicada.
5. Cuando existe una nueva entrega, repiten el proceso con el APK actualizado.

### Publicación

Pasos resumidos para replicar el proceso en el equipo:

1. Validar la versión en `pubspec.yaml`.
2. Ejecutar la compilación release del APK.
3. Subir el archivo generado al panel de App Distribution.
4. Verificar la lista de testers y el mensaje de publicación.
5. Compartir el acceso con el equipo de pruebas.
6. Confirmar instalación y feedback en el dispositivo.

Comando habitual para generar el APK:

```bash
flutter build apk --release
```

### Versionado

El proyecto usa el formato estándar de Flutter:

`version: 1.1.0+2`

Donde:

1. `1.1.0` representa la versión visible de la app.
2. `2` es el número de build o compilación.
3. En cada publicación se recomienda aumentar el build y, si aplica, el número semántico.

Guía de cambios usada para las notas de release:

1. `MAYOR`: cambios incompatibles con versiones anteriores.
2. `MINOR`: nuevas funcionalidades sin romper compatibilidad.
3. `PATCH`: correcciones de errores sin romper compatibilidad.
4. `BUILD`: ajustes menores que no afectan la versión funcional.

Formato sugerido para Release Notes:

```text
Versión: 1.1.0+2

- Se corrigieron errores de navegación.
- Se optimizó la carga de datos.
- Se agregaron mejoras visuales en la pantalla principal.
```

### Qué incluye la app

La estructura del proyecto muestra módulos para:

1. Pantalla principal y navegación por rutas.
2. Paso de parámetros y detalle de información.
3. Ciclo de vida, `Future`, `Timer` e `Isolate`.
4. Listados y detalle de áreas naturales, mapas, reservas indígenas y especies invasivas.

