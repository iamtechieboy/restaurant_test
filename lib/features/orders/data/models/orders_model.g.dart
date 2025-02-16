// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      tableId: (json['tableId'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
      isClose: (json['isClose'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] as String? ?? "",
      tableName: json['tableName'] as String? ?? "",
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tableId': instance.tableId,
      'total': instance.total,
      'isClose': instance.isClose,
      'createdAt': instance.createdAt,
      'tableName': instance.tableName,
    };
