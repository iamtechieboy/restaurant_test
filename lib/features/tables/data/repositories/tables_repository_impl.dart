import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/features/tables/data/data_sources/tables_local_datasource.dart';
import 'package:restaurant_test/features/tables/domain/entities/categories_entity.dart';
import 'package:restaurant_test/features/tables/domain/entities/order_product_entity.dart';
import 'package:restaurant_test/features/tables/domain/entities/table_entity.dart';
import 'package:restaurant_test/features/tables/domain/repositories/tables_repository.dart';

class TablesRepositoryImpl implements TablesRepository {
  final TablesLocalDataSource tablesDataSource;

  TablesRepositoryImpl({required this.tablesDataSource});

  @override
  Future<Either<Failure, List<OrderProductEntity>>> getTableOrderDetails(int orderId) async {
    return tablesDataSource.getTableOrderDetails(orderId).then((value) {
      return Right(value.map((e) => e.toEntity()).toList());
    });
  }

  @override
  Future<Either<Failure, List<TableEntity>>> getTables() {
    return tablesDataSource.getTables().then((value) {
      return Right(value.map((e) => e.toEntity()).toList());
    });
  }

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getFoodCategories() {
    return tablesDataSource.getCategories().then((value) {
      return Right(value.map((e) => e.toEntity()).toList());
    });
  }
}
