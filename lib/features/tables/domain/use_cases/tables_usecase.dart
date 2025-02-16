import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/features/tables/domain/repositories/tables_repository.dart';
import 'package:restaurant_test/features/tables/domain/entities/table_entity.dart';

class GetTablesUseCase implements UseCase<List<TableEntity>, NoParams> {
  final TablesRepository tablesRepository;

  GetTablesUseCase({
    required this.tablesRepository,
  });

  @override
  Future<Either<Failure, List<TableEntity>>> call(NoParams params) async {
    return await tablesRepository.getTables();
  }
}
