import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ServerFailure extends Failure {
  final num statusCode;

  const ServerFailure({required super.errorMessage, required this.statusCode});
}

class DioFailure extends Failure {
  const DioFailure({required super.errorMessage});
}

class ParsingFailure extends Failure {
  const ParsingFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.errorMessage});
}

      