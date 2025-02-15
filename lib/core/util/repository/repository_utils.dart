import 'package:restaurant_test/core/error/error_handler.dart';
import 'package:restaurant_test/core/error/failure_handler.dart';
import 'package:restaurant_test/core/util/either.dart';

typedef CheckException<T> = Future<T> Function();

mixin RepositoryUtil {
  Future<Either<Failure, T>> callSafely<T>(CheckException function) async {
    try {
      final result = await function();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }
}
