import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_test/features/tables/data/models/food_model.dart';
import 'package:restaurant_test/features/tables/domain/entities/categories_entity.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  final int id;
  final String name;
  final List<FoodModel> foods;

  CategoriesModel({
    this.id = 0,
    this.name = '',
    this.foods = const [],
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);

  factory CategoriesModel.fromEntity(CategoriesEntity entity) {
    return CategoriesModel(
      id: entity.id,
      name: entity.name,
      foods: entity.foods.map((e) => FoodModel.fromEntity(e)).toList(),
    );
  }

  CategoriesEntity toEntity() {
    return CategoriesEntity(
      id: id,
      name: name,
      foods: foods.map((e) => e.toEntity()).toList(),
    );
  }
}
