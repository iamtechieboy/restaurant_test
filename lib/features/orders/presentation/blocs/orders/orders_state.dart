part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  final FormzSubmissionStatus status;
  final List<OrdersEntity> ordersList;

  const OrdersState({
    this.status = FormzSubmissionStatus.initial,
    this.ordersList = const [],
  });

  @override
  List<Object?> get props => [
        status,
        ordersList,
      ];

  OrdersState copyWith({
    FormzSubmissionStatus? status,
    List<OrdersEntity>? ordersList,
  }) {
    return OrdersState(
      status: status ?? this.status,
      ordersList: ordersList ?? this.ordersList,
    );
  }
}
