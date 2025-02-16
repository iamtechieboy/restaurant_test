part of 'table_single_bloc.dart';

class TableSingleState extends Equatable {
  const TableSingleState({
    this.tablesEntity = const TableEntity(),
    this.orderProducts = const [],
  });

  final TableEntity tablesEntity;
  final List<OrderProductEntity> orderProducts;

  TableSingleState copyWith({
    TableEntity? tablesEntity,
    List<OrderProductEntity>? orderProducts,
  }) {
    return TableSingleState(
      tablesEntity: tablesEntity ?? this.tablesEntity,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }

  @override
  List<Object> get props => [
        tablesEntity,
        orderProducts,
      ];
}
