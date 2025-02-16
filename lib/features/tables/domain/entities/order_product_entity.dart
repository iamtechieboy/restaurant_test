import 'package:equatable/equatable.dart';

class OrderProductEntity extends Equatable {
  final int id;
  final int orderId;
  final String foodName;
  final String foodDescription;
  final String foodImage;
  final int quantity;
  final int price;

  const OrderProductEntity({
    this.id = 0,
    this.orderId = 0,
    this.foodName = '',
    this.foodDescription = '',
    this.foodImage = '',
    this.quantity = 0,
    this.price = 0,
  });

  @override
  List<Object?> get props => [
        id,
        orderId,
        foodName,
        foodDescription,
        foodImage,
        quantity,
        price,
      ];
}
