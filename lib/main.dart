import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_test/core/service_locator.dart';
import 'package:restaurant_test/core/routing/app_routing.dart';
import 'package:restaurant_test/core/config/app_theme.dart';
import 'package:restaurant_test/generated/codegen_loader.g.dart';

import 'core/util/hive/hive_utils.dart';


Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await setupServiceLocator();
      await initHive();
      runApp(
        EasyLocalization(
          supportedLocales: const [
            Locale('uz'),
          ],
          path: 'lib/assets/translations',
          fallbackLocale: const Locale('uz'),
          startLocale: const Locale('uz'),
          assetLoader: const CodegenLoader(),
          child: MyApp(),
        ),
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
      child: MaterialApp.router(
        key: _navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Restaurant Management',
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        theme: AppTheme.theme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
  