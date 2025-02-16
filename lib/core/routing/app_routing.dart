// DO NOT DELETE THIS COMMENTED CODE
//::IMPORTS::
import 'package:flutter/cupertino.dart';
import 'package:restaurant_test/features/tables/domain/entities/table_entity.dart';
import 'package:restaurant_test/features/tables/presentation/pages/table_single_screen.dart';
import 'package:restaurant_test/features/tables/presentation/pages/tables_screen.dart';
import 'package:restaurant_test/features/orders/presentation/pages/orders_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_test/features/navigation/presentation/navigation_screen.dart';
import 'package:restaurant_test/features/tables/presentation/pages/menus_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  // DO NOT DELETE THIS COMMENTED CODE
  //::NAMES::

  static const String tables = '/tables';
  static const String tableSingle = 'tables/tableSingle';
  static const String menus = 'tables/tableSingle/menus';
  static const String orders = "/orders";

  static final GoRouter router = GoRouter(
    initialLocation: tables,
    navigatorKey: navigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => NavigationScreen(
          statefulNavigationShell: navigationShell,
        ),
        branches: [
          /// Navigation section
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: tables,
                path: tables,
                builder: (context, state) => const TablesScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    name: tableSingle,
                    path: tableSingle,
                    parentNavigatorKey: navigatorKey,
                    builder: (context, state) => TableSingleScreen(tableEntity: state.extra as TableEntity),
                    routes: <RouteBase>[
                      GoRoute(
                        name: menus,
                        path: menus,
                        parentNavigatorKey: navigatorKey,
                        builder: (context, state) => const MenusWidget(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          /// Setting section
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: orders,
                path: orders,
                builder: (context, state) => const OrdersScreen(),
                routes: const <RouteBase>[],
              ),
            ],
          ),
        ],
      ),

      // DO NOT DELETE THIS COMMENTED CODE
      //::ROUTES::
    ],
  );
}
