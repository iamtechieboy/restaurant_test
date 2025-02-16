part of 'menus_bloc.dart';

@immutable
sealed class MenusEvent {}

class GetCategories extends MenusEvent {}

class AddToCart extends MenusEvent {
  final FoodEntity food;

  AddToCart(this.food);
}

class RemoveFromCard extends MenusEvent {
  final FoodEntity food;

  RemoveFromCard(this.food);
}
