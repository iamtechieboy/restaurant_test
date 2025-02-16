import 'package:restaurant_test/features/tables/domain/entities/food_entity.dart';

class OrderCreateParams {
  final List<FoodEntity> food;
  final int tableId;

  OrderCreateParams({
    required this.food,
    required this.tableId,
  });
}

class OrderUpdateParams {
  final String orderId;
  final int tableId;

  OrderUpdateParams({
    required this.orderId,
    required this.tableId,
  });
}