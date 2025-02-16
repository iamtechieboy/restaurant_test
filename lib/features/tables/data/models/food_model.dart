import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_test/features/tables/domain/entities/food_entity.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final int price;
  final String image;

  const FoodModel({
    this.id = 0,
    this.categoryId = 0,
    this.name = '',
    this.description = '',
    this.price = 0,
    this.image = '',
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => _$FoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);

  factory FoodModel.fromEntity(FoodEntity entity) {
    return FoodModel(
      id: entity.id,
      categoryId: entity.categoryId,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      image: entity.image,
    );
  }

  FoodEntity toEntity() {
    return FoodEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      description: description,
      price: price,
      image: image,
    );
  }
}
