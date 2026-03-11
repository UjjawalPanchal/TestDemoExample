import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/main.dart';
import 'package:test_project/screens/detail_screen/detail_demo_screen.dart';
import 'package:test_project/screens/list_demo_screen/list_demo_screen.dart';

/// The route configuration.
class MyRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: MyRoutes.initial,
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: MyRoutes.listHome,
            builder: (BuildContext context, GoRouterState state) {
              return const ListDemoScreen();
            },
          ),
          GoRoute(
            path: "${MyRoutes.listDetails}/:todoId",
            builder: (BuildContext context, GoRouterState state) {
              final todoId = state.pathParameters['todoId'] ?? '';
              return DetailDemoScreen(todoId: todoId);
            },
          ),
        ],
      ),
    ],
  );
}

class MyRoutes {
  static String initial = '/';
  static String listHome = '/list-home';
  static String listDetails = '/list-details';
}
