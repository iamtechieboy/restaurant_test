import 'package:equatable/equatable.dart';
import 'package:restaurant_test/core/util/either.dart';
import 'package:restaurant_test/core/error/failure_handler.dart';

    
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
        
abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}
        
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
      