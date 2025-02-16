import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_test/core/db_helper/db_helper.dart';
import 'package:restaurant_test/core/service_locator.dart';
import 'package:restaurant_test/core/routing/app_routing.dart';
import 'package:restaurant_test/core/config/app_theme.dart';
import 'package:restaurant_test/features/orders/presentation/blocs/orders/orders_bloc.dart';
import 'package:restaurant_test/features/tables/presentation/blocs/tables/tables_bloc.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await setupServiceLocator();
      await serviceLocator.get<DBHelper>().init();
      runApp(
        MyApp(),
      );
    },
    (error, stack) {
      log("Error by runZoneGuarded: ", error: error, stackTrace: stack, level: 10, zone: Zone.current);
    },
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TablesBloc(
              getTablesUseCase: serviceLocator(),
              getSingleTable: serviceLocator(),
            ),
          ),
          BlocProvider(
            create: (_) => OrdersBloc(
              ordersUseCase: serviceLocator(),
            ),
          ),
        ],
        child: MaterialApp.router(
          key: _navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Management',
          theme: AppTheme.theme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
