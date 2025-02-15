import 'package:get_it/get_it.dart';
import 'package:restaurant_test/core/services/shared_preference_manager.dart';
import 'package:restaurant_test/core/util/hive/hive_utils.dart';

// DO DELETE THIS COMMENTED CODE
// ::IMPORTS::

final GetIt serviceLocator = GetIt.instance;

/// Service locator setup
Future<void> setupServiceLocator() async {
  await SharedPreferenceManager.getInstance();

  serviceLocator.registerLazySingleton(() => HiveUtil());

  // DO DELETE THIS COMMENTED CODE
  // ::REGISTERED_FEATURES::
}

// DO DELETE THIS COMMENTED CODE
// ::METHODS::
