import 'package:desarollo_movil/views/future/future_view.dart';
import 'package:desarollo_movil/views/isolate/isolate_view.dart';
import 'package:go_router/go_router.dart';
import 'package:desarollo_movil/views/ciclo_vida/ciclo_vida_screen.dart';
import 'package:desarollo_movil/views/home/home_screen.dart';
import 'package:desarollo_movil/views/paso_parametros/detalle_screen.dart';
import 'package:desarollo_movil/views/paso_parametros/paso_parametros_screen.dart';

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
    //!Ruta para el ciclo de vida
    GoRoute(
      path: '/ciclo_isolate',
      name: 'ciclo_isolate',
      builder: (context, state) => const IsolateView(),
    ),
    //!Ruta para el ciclo de vida
    GoRoute(
      path: '/ciclo_future',
      name: 'ciclo_future',
      builder: (context, state) => const FutureView(),
    ),
  ],
  
);
