import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/core/util/params.dart';
import 'package:restaurant_test/features/orders/domain/entities/orders_entity.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrdersEntity>>> getOrders();

  Future<Either<Failure, int>> createOrder(OrderCreateParams params);

  Future<Either<Failure, void>> closeOrder(String orderId);

  Future<Either<Failure, void>> updateOrder(OrderUpdateParams params);
}
    