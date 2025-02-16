import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/features/tables/domain/entities/order_product_entity.dart';
import 'package:restaurant_test/features/tables/domain/repositories/tables_repository.dart';

class GetTableUseCase implements UseCase<List<OrderProductEntity>, int> {
  final TablesRepository tablesRepository;

  GetTableUseCase({
    required this.tablesRepository,
  });

  @override
  Future<Either<Failure, List<OrderProductEntity>>> call(int orderId) async {
    return await tablesRepository.getTableOrderDetails(orderId);
  }
}
