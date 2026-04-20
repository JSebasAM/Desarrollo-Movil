# Desarrollo Movil - Taller Flutter

## Datos
- **Nombre completo:** Jose Sebastian Arenas Moncada
- **Codigo:** 230231036

## Objetivo del taller
Este taller implementa ejemplos de trabajo en segundo plano en Flutter, separados por capas simples de `services` y `views`:

1. `Future` con `async/await`.
2. `Timer` para cronometro.
3. `Isolate` para tarea pesada CPU-bound.

## Estructura usada
La app sigue una estructura sencilla y pedagogica:

- `lib/services/`: logica de procesos (Future, Timer, Isolate).
- `lib/views/`: pantallas por modulo.
- `lib/widgets/custom_drawer.dart`: menu de navegacion comun.
- `lib/routes/app_router.dart`: registro de rutas.

## Cuando usar cada herramienta

### 1) Future y async/await
Usar cuando necesitas esperar resultados asincronos (por ejemplo, simulacion de consulta o llamada HTTP) sin bloquear la UI.

- `Future`: representa un valor que llegara despues.
- `async/await`: permite escribir flujo asincrono de forma secuencial y legible.

Ejemplo del proyecto:
- Archivo: `lib/services/future_service.dart`
- Vista: `lib/views/future/future_screen.dart`

### 2) Timer
Usar cuando necesitas eventos repetidos por intervalo (cronometro, cuenta regresiva, polling controlado).

- `Timer.periodic`: ejecuta una accion cada intervalo.
- Importante: cancelar timer en `pausar`, `reiniciar` y `dispose` para liberar recursos.

Ejemplo del proyecto:
- Archivo: `lib/services/timer_service.dart`
- Vista: `lib/views/timer/timer_screen.dart`

### 3) Isolate
Usar para tareas pesadas de CPU que podrian congelar la interfaz si se ejecutan en el hilo principal.

- `Isolate.spawn`: ejecuta la tarea en otro isolate.
- `ReceivePort/SendPort`: comunican resultado y errores.

Ejemplo del proyecto:
- Archivo: `lib/services/isolate_service.dart`
- Vista: `lib/views/isolate/isolate_screen.dart`

## Pantallas y flujos

### Menu (Custom Drawer)
Desde el drawer puedes navegar a:

- Inicio
- Paso de Parametros
- Ciclo de Vida
- Future
- Timer
- Isolate

### Flujo de Timer

1. Entrar a pantalla `Timer`.
2. Presionar **Iniciar**.
3. El tiempo se actualiza cada 1 segundo (marcador grande `mm:ss`).
4. Puedes **Pausar**, **Reanudar** y **Reiniciar**.
5. Al salir de la vista se ejecuta `dispose()` y se cancela el timer.

### Flujo de Isolate

1. Entrar a pantalla `Isolate`.
2. Presionar **Ejecutar proceso pesado**.
3. Se lanza una suma grande en segundo plano con `Isolate.spawn`.
4. El resultado vuelve por mensajes y se muestra en la UI.
5. Durante el proceso, la UI sigue respondiendo (latido/contador visible en pantalla).

## Pasos para ejecutar

1. Abrir una terminal en la raiz del proyecto.
2. Instalar dependencias:

```bash
flutter pub get
```

3. Seleccionar dispositivo en VS Code:

```bash
Ctrl + Shift + P
Flutter: Select Device
```

4. Ejecutar la aplicacion:

```bash
flutter run
```

## Capturas

- Captura 1: Pantalla principal

<img src="lib/assets/markdown/img1.jpeg" width="300">

- Captura 2: Cambio de fondo con TextButton y Grid

<img src="lib/assets/markdown/img2.jpeg" width="300">

