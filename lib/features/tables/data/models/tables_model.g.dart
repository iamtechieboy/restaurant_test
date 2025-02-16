// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TablesModel _$TablesModelFromJson(Map<String, dynamic> json) => TablesModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      orderId: (json['orderId'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TablesModelToJson(TablesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'orderId': instance.orderId,
    };
