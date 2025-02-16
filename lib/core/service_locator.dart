import 'package:get_it/get_it.dart';
import 'package:restaurant_test/core/db_helper/db_helper.dart';
import 'package:restaurant_test/features/orders/data/data_sources/orders_local_datasource.dart';
import 'package:restaurant_test/features/orders/domain/use_cases/close_order_usecase.dart';
import 'package:restaurant_test/features/orders/domain/use_cases/create_order_usecase.dart';
import 'package:restaurant_test/features/orders/domain/use_cases/update_order_usecase.dart';
import 'package:restaurant_test/features/tables/data/data_sources/tables_local_datasource.dart';

// DO DELETE THIS COMMENTED CODE
// ::IMPORTS::
import 'package:restaurant_test/features/tables/data/repositories/tables_repository_impl.dart';
import 'package:restaurant_test/features/tables/domain/use_cases/categories_usecase.dart';
import 'package:restaurant_test/features/tables/domain/use_cases/table_usecase.dart';
import 'package:restaurant_test/features/tables/domain/use_cases/tables_usecase.dart';
import 'package:restaurant_test/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:restaurant_test/features/orders/domain/use_cases/orders_usecase.dart';

final GetIt serviceLocator = GetIt.instance;

/// Service locator setup
Future<void> setupServiceLocator() async {
  serviceLocator.registerLazySingleton(() => DBHelper());

  // DO DELETE THIS COMMENTED CODE
  // ::REGISTERED_FEATURES::
  setupTablesDependencies();
  setupOrdersDependencies();
}

// DO DELETE THIS COMMENTED CODE
// ::METHODS::

void setupTablesDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => TablesLocalDataSourceImpl(serviceLocator<DBHelper>()))

    // Repositories
    ..registerLazySingleton(() => TablesRepositoryImpl(tablesDataSource: serviceLocator<TablesLocalDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => GetTablesUseCase(tablesRepository: serviceLocator<TablesRepositoryImpl>()))
    ..registerLazySingleton(() => GetCategoriesUseCase(tablesRepository: serviceLocator<TablesRepositoryImpl>()))
    ..registerLazySingleton(() => GetTableUseCase(tablesRepository: serviceLocator<TablesRepositoryImpl>()));

  //Bloc
}

void setupOrdersDependencies() {
  // Data Sources
  serviceLocator
    ..registerLazySingleton(() => OrdersLocalDataSourceImpl(serviceLocator<DBHelper>()))

    // Repositories
    ..registerLazySingleton(() => OrdersRepositoryImpl(ordersDataSource: serviceLocator<OrdersLocalDataSourceImpl>()))

    // Use Cases
    ..registerLazySingleton(() => OrdersUseCase(ordersRepository: serviceLocator<OrdersRepositoryImpl>()))
    ..registerLazySingleton(() => CloseOrderUseCase(ordersRepository: serviceLocator<OrdersRepositoryImpl>()))
    ..registerLazySingleton(() => UpdateOrderUseCase(ordersRepository: serviceLocator<OrdersRepositoryImpl>()))
    ..registerLazySingleton(() => CreateOrderUseCase(ordersRepository: serviceLocator<OrdersRepositoryImpl>()));
}
