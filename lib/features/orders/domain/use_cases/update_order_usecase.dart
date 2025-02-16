import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/core/util/params.dart';
import 'package:restaurant_test/features/orders/domain/repositories/orders_repository.dart';

class UpdateOrderUseCase implements UseCase<void, OrderUpdateParams> {
  final OrdersRepository ordersRepository;

  UpdateOrderUseCase({
    required this.ordersRepository,
  });

  @override
  Future<Either<Failure, void>> call(OrderUpdateParams params) async {
    return await ordersRepository.updateOrder(params);
  }
}
