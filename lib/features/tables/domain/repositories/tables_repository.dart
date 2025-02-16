import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/features/tables/domain/entities/categories_entity.dart';
import 'package:restaurant_test/features/tables/domain/entities/order_product_entity.dart';
import 'package:restaurant_test/features/tables/domain/entities/table_entity.dart';

abstract class TablesRepository {
  Future<Either<Failure, List<TableEntity>>> getTables();

  Future<Either<Failure, List<CategoriesEntity>>> getFoodCategories();

  Future<Either<Failure, List<OrderProductEntity>>> getTableOrderDetails(int orderId);
}
