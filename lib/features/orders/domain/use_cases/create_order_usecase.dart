import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/core/util/params.dart';
import 'package:restaurant_test/features/orders/domain/repositories/orders_repository.dart';

class CreateOrderUseCase implements UseCase<int, OrderCreateParams> {
  final OrdersRepository ordersRepository;

  CreateOrderUseCase({
    required this.ordersRepository,
  });

  @override
  Future<Either<Failure, int>> call(OrderCreateParams params) async {
    return await ordersRepository.createOrder(params);
  }
}
