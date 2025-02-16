import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_test/features/tables/domain/entities/order_product_entity.dart';

part 'order_product_model.g.dart';

@JsonSerializable()
class OrderProductModel {
  final int id;
  final int orderId;
  final String foodName;
  final String foodDescription;
  final String foodImage;
  final int quantity;
  final int price;

  OrderProductModel({
    this.id = 0,
    this.orderId = 0,
    this.quantity = 0,
    this.price = 0,
    this.foodName = '',
    this.foodDescription = '',
    this.foodImage = '',
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) => _$OrderProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductModelToJson(this);

  factory OrderProductModel.fromEntity(OrderProductEntity entity) {
    return OrderProductModel(
      id: entity.id,
      orderId: entity.orderId,
      quantity: entity.quantity,
      foodName: entity.foodName,
      foodDescription: entity.foodDescription,
      foodImage: entity.foodImage,
      price: entity.price,
    );
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      id: id,
      orderId: orderId,
      foodName: foodName,
      foodDescription: foodDescription,
      foodImage: foodImage,
      quantity: quantity,
      price: price,
    );
  }
}
