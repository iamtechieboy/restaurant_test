import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_test/core/util/params.dart';
import 'package:restaurant_test/features/orders/domain/use_cases/close_order_usecase.dart';
import 'package:restaurant_test/features/orders/domain/use_cases/update_order_usecase.dart';
import 'package:restaurant_test/features/tables/domain/entities/food_entity.dart';
import 'package:restaurant_test/features/tables/domain/entities/order_product_entity.dart';
import 'package:restaurant_test/features/tables/domain/entities/table_entity.dart';
import 'package:restaurant_test/features/tables/domain/use_cases/table_usecase.dart';

import '../../../../orders/domain/use_cases/create_order_usecase.dart';

part 'table_single_event.dart';

part 'table_single_state.dart';

class TableSingleBloc extends Bloc<TableSingleEvent, TableSingleState> {
  final GetTableUseCase getTableUseCase;
  final CreateOrderUseCase createOrderUseCase;
  final CloseOrderUseCase closeOrderUseCase;
  final UpdateOrderUseCase updateOrderUseCase;

  TableSingleBloc({
    required this.getTableUseCase,
    required this.createOrderUseCase,
    required this.closeOrderUseCase,
    required this.updateOrderUseCase,
  }) : super(const TableSingleState()) {
    on<InitBloc>(
      (event, emit) {
        emit(state.copyWith(tablesEntity: event.tableEntity));
        if (event.tableEntity.orderId != 0) {
          add(GetTableOrderDetails(event.tableEntity.orderId));
        }
      },
    );
    on<GetTableOrderDetails>((event, emit) async {
      final result = await getTableUseCase(event.orderId);
      if (result.isRight) {
        emit(state.copyWith(
          orderProducts: [...result.right],
          tablesEntity: state.tablesEntity.copyWith(
            orderId: event.orderId,
          ),
        ));
      }
    });

    on<CreateOrder>((event, emit) async {
      final result = await createOrderUseCase(
        OrderCreateParams(
          tableId: state.tablesEntity.id,
          food: event.foods,
        ),
      );
      if (result.isRight) {
        event.callback();
        add(GetTableOrderDetails(result.right));
      }
    });
    on<CloseOrder>((event, emit) async {
      closeOrderUseCase(
        state.tablesEntity.orderId.toString(),
      ).then((value) => event.callback());
    });
  }
}
