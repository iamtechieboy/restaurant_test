import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/features/tables/domain/entities/categories_entity.dart';
import 'package:restaurant_test/features/tables/domain/entities/food_entity.dart';
import 'package:restaurant_test/features/tables/domain/use_cases/categories_usecase.dart';

part 'menus_event.dart';

part 'menus_state.dart';

class MenusBloc extends Bloc<MenusEvent, MenusState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  MenusBloc({
    required this.getCategoriesUseCase,
  }) : super(const MenusState()) {
    on<GetCategories>((event, emit) async {
      final result = await getCategoriesUseCase(NoParams());
      if (result.isRight) {
        emit(state.copyWith(categories: result.right));
      } else {}
    });

    on<AddToCart>((event, emit) {
      var newCart = [...state.cartList];
      if (newCart.any((element) => element.id == event.food.id)) {
        newCart = state.cartList.map((food) {
          if (food.id == event.food.id) {
            return food.copyWith(amount: food.amount + 1);
          }
          return food;
        }).toList();
      } else {
        newCart.add(event.food.copyWith(amount: 1));
      }
      emit(state.copyWith(cartList: newCart));
    });

    on<RemoveFromCard>((event, emit) {
      var newCart = [...state.cartList];
      if (newCart.any((element) => element.id == event.food.id)) {
        final amount = newCart.firstWhere((element) => element.id == event.food.id).amount;
        if (amount > 1) {
          newCart = state.cartList.map((food) {
            if (food.id == event.food.id) {
              return food.copyWith(amount: food.amount - 1);
            }
            return food;
          }).toList();
        } else {
          newCart.removeWhere((element) => element.id == event.food.id);
        }
      }
      emit(state.copyWith(cartList: newCart));
    });
  }
}
