// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) =>
    OrderProductModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      orderId: (json['orderId'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toInt() ?? 0,
      foodName: json['foodName'] as String? ?? '',
      foodDescription: json['foodDescription'] as String? ?? '',
      foodImage: json['foodImage'] as String? ?? '',
    );

Map<String, dynamic> _$OrderProductModelToJson(OrderProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'foodName': instance.foodName,
      'foodDescription': instance.foodDescription,
      'foodImage': instance.foodImage,
      'quantity': instance.quantity,
      'price': instance.price,
    };
