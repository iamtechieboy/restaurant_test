import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/features/orders/domain/entities/orders_entity.dart';
import 'package:restaurant_test/features/orders/domain/use_cases/orders_usecase.dart';

part 'orders_event.dart';

part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersUseCase ordersUseCase;

  OrdersBloc({required this.ordersUseCase}) : super(const OrdersState()) {
    on<OrdersGetEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await ordersUseCase(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          ordersList: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
