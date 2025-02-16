part of 'menus_bloc.dart';

class MenusState extends Equatable {
  final List<CategoriesEntity> categories;
  final List<FoodEntity> cartList;

  const MenusState({
    this.categories = const [],
    this.cartList = const [],
  });

  MenusState copyWith({
    List<CategoriesEntity>? categories,
    List<FoodEntity>? cartList,
  }) {
    return MenusState(
      categories: categories ?? this.categories,
      cartList: cartList ?? this.cartList,
    );
  }

  @override
  List<Object?> get props => [
        categories,
        cartList,
      ];
}
