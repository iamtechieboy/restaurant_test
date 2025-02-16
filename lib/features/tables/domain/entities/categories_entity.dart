import 'package:equatable/equatable.dart';
import 'package:restaurant_test/features/tables/domain/entities/food_entity.dart';

class CategoriesEntity extends Equatable {
  final int id;
  final String name;
  final List<FoodEntity> foods;

  const CategoriesEntity({
    this.id = 0,
    this.name = "",
    this.foods = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        foods,
      ];
}
