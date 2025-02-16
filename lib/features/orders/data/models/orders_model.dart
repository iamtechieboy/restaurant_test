import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_test/features/orders/domain/entities/orders_entity.dart';

part 'orders_model.g.dart';

@JsonSerializable()
class OrdersModel {
  final int id;
  final int tableId;
  final int total;
  final int isClose;
  final String createdAt;
  final String tableName;

  OrdersModel({
    this.id = 0,
    this.tableId = 0,
    this.total = 0,
    this.isClose = 0,
    this.createdAt = "",
    this.tableName = "",
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => _$OrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersModelToJson(this);

  OrdersEntity toEntity() {
    return OrdersEntity(
      id: id,
      tableId: tableId,
      total: total,
      isClose: isClose,
      createdAt: createdAt,
      tableName: tableName,
    );
  }

  factory OrdersModel.fromEntity(OrdersEntity entity) {
    return OrdersModel(
      id: entity.id,
      tableId: entity.tableId,
      total: entity.total,
      isClose: entity.isClose,
      createdAt: entity.createdAt,
      tableName: entity.tableName,
    );
  }
}
