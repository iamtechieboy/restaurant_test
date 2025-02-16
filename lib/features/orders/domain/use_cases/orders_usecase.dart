import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/features/orders/domain/repositories/orders_repository.dart';
import 'package:restaurant_test/features/orders/domain/entities/orders_entity.dart';

class OrdersUseCase implements UseCase<List<OrdersEntity>, NoParams> {
  final OrdersRepository ordersRepository;

  OrdersUseCase({
    required this.ordersRepository,
  });

  @override
  Future<Either<Failure, List<OrdersEntity>>> call(NoParams params) async {
    return await ordersRepository.getOrders();
  }
}
