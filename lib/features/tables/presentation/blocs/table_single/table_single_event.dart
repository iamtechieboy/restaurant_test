part of 'table_single_bloc.dart';

@immutable
sealed class TableSingleEvent {}

class InitBloc extends TableSingleEvent {
  final TableEntity tableEntity;

  InitBloc(this.tableEntity);
}

class GetTableOrderDetails extends TableSingleEvent {
  final int orderId;

  GetTableOrderDetails(this.orderId);
}

class CreateOrder extends TableSingleEvent {
  final List<FoodEntity> foods;
  final Function() callback;

  CreateOrder({
    required this.foods,
    required this.callback,
  });
}

class CloseOrder extends TableSingleEvent {
  final Function callback;

  CloseOrder({required this.callback});
}
