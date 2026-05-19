import 'package:desarollo_movil/views/areasNaturales/areaNaturalListView.dart';
import 'package:desarollo_movil/views/areasNaturales/detallesAreasNaturales.dart';
import 'package:desarollo_movil/views/especiesInvasivas/detallesEspeciesInvasivas.dart';
import 'package:desarollo_movil/views/especiesInvasivas/especiesInvasivasListView.dart';
import 'package:desarollo_movil/views/mapas/detallesMapas.dart';
import 'package:desarollo_movil/views/mapas/mapasListView.dart';
import 'package:go_router/go_router.dart';
import 'package:desarollo_movil/views/ciclo_vida/ciclo_vida_screen.dart';
import 'package:desarollo_movil/views/future/future_screen.dart';
import 'package:desarollo_movil/views/home/home_screen.dart';
import 'package:desarollo_movil/views/isolate/isolate_screen.dart';
import 'package:desarollo_movil/views/reservasIndigenas/detallesReservasIndigenas.dart';
import 'package:desarollo_movil/views/reservasIndigenas/reservasIndigenasListView.dart';
import 'package:desarollo_movil/views/paso_parametros/detalle_screen.dart';
import 'package:desarollo_movil/views/paso_parametros/paso_parametros_screen.dart';
import 'package:desarollo_movil/views/timer/timer_screen.dart';
import 'package:desarollo_movil/views/universidades/universidadesListView.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(), // Usa HomeView
    ),
    // Rutas para el paso de parámetros
    GoRoute(
      path: '/paso_parametros',
      builder: (context, state) => const PasoParametrosScreen(),
    ),

    // !Ruta para el detalle con parámetros
    GoRoute(
      path:
          '/detalle/:parametro/:metodo', //la ruta recibe dos parametros los " : " indican que son parametros
      builder: (context, state) {
        //*se capturan los parametros recibidos
        // declarando las variables parametro y metodo
        // es final porque no se van a modificar
        final parametro = state.pathParameters['parametro']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleScreen(parametro: parametro, metodoNavegacion: metodo);
      },
    ),
    //!Ruta para el ciclo de vida
    GoRoute(
      path: '/ciclo_vida',
      name: 'ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
    GoRoute(
      path: '/future',
      name: 'future',
      builder: (context, state) => const FutureScreen(),
    ),
    GoRoute(
      path: '/timer',
      name: 'timer',
      builder: (context, state) => const TimerScreen(),
    ),
    GoRoute(
      path: '/isolate',
      name: 'isolate',
      builder: (context, state) => const IsolateScreen(),
    ),
    //Rutas ListView
    GoRoute(
      path: '/area-natural',
      builder: (context, state) => const Areanaturallistview(),
    ),
    GoRoute(
      path: '/mapas',
      builder: (context, state) => const Mapaslistview(),
    ),
    GoRoute(
      path: '/reservas-indigenas',
      builder: (context, state) => const ReservasIndigenasListView(),
    ),
    GoRoute(
      path: '/especies-invasivas',
      builder: (context, state) => const EspeciesInvasivasListView(),
    ),
    GoRoute(
      path: '/universidades',
      builder: (context, state) => const UniversidadesListView(),
    ),
    //Rutas Detalles
    GoRoute(
      path:
          '/area-natural/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return Detallesareasnaturales(id: int.parse(id));
      },
    ),
    GoRoute(
      path:
          '/mapas/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DetallesMapas(id: int.parse(id));
      },
    ),
    GoRoute(
      path: '/reservas-indigenas/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DetallesReservasIndigenas(id: int.parse(id));
      },
    ),
    GoRoute(
      path: '/especies-invasivas/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DetallesEspeciesInvasivas(id: int.parse(id));
      },
    ),
  ],
);
