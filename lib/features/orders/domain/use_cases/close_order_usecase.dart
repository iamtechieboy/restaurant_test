import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/features/orders/domain/repositories/orders_repository.dart';

class CloseOrderUseCase implements UseCase<void, String> {
  final OrdersRepository ordersRepository;

  CloseOrderUseCase({
    required this.ordersRepository,
  });

  @override
  Future<Either<Failure, void>> call(String orderId) async {
    return await ordersRepository.closeOrder(orderId);
  }
}
