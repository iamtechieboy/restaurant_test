import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/features/tables/domain/entities/categories_entity.dart';
import 'package:restaurant_test/features/tables/domain/repositories/tables_repository.dart';

class GetCategoriesUseCase implements UseCase<List<CategoriesEntity>, NoParams> {
  final TablesRepository tablesRepository;

  GetCategoriesUseCase({
    required this.tablesRepository,
  });

  @override
  Future<Either<Failure, List<CategoriesEntity>>> call(NoParams params) async {
    return await tablesRepository.getFoodCategories();
  }
}
