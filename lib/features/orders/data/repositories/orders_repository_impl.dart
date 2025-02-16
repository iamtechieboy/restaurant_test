import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/core/util/params.dart';
import 'package:restaurant_test/core/util/repository/repository_utils.dart';
import 'package:restaurant_test/features/orders/data/data_sources/orders_local_datasource.dart';
import 'package:restaurant_test/features/orders/domain/entities/orders_entity.dart';
import 'package:restaurant_test/features/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImpl with RepositoryUtil implements OrdersRepository {
  final OrdersLocalDataSource ordersDataSource;

  OrdersRepositoryImpl({required this.ordersDataSource});

  @override
  Future<Either<Failure, List<OrdersEntity>>> getOrders() {
    return callSafely(() async {
      var result = await ordersDataSource.getOrders();
      return result.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, int>> createOrder(OrderCreateParams params) {
    return callSafely<int>(() async {
      return await ordersDataSource.createOrder(params);
    });
  }

  @override
  Future<Either<Failure, void>> closeOrder(String orderId) {
    return callSafely(() async {
      await ordersDataSource.closeOrder(orderId);
    });
  }

  @override
  Future<Either<Failure, void>> updateOrder(OrderUpdateParams params) {
    return callSafely(() async {
      await ordersDataSource.updateOrder(params);
    });
  }
}
