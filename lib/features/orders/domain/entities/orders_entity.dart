import 'package:equatable/equatable.dart';

class OrdersEntity extends Equatable {
  final int id;
  final int tableId;
  final int total;
  final int isClose;
  final String createdAt;
  final String tableName;

  const OrdersEntity({
    this.id = 0,
    this.tableId = 0,
    this.total = 0,
    this.isClose = 0,
    this.createdAt = '',
    this.tableName = '',
  });

  bool get isClosed => isClose == 1;

  @override
  List<Object?> get props => [
        id,
        tableId,
        total,
        isClose,
        createdAt,
        tableName,
      ];
}
