import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final int price;
  final String image;
  final int amount;

  const FoodEntity({
    this.id = 0,
    this.categoryId = 0,
    this.name = '',
    this.description = '',
    this.price = 0,
    this.image = '',
    this.amount = 0,
  });

  FoodEntity copyWith({
    int? id,
    int? categoryId,
    String? name,
    String? description,
    int? price,
    String? image,
    int? amount,
  }) {
    return FoodEntity(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object?> get props => [
        id,
        categoryId,
        name,
        description,
        price,
        image,
        amount,
      ];
}
