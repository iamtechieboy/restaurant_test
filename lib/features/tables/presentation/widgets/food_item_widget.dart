import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_test/core/config/app_colors.dart';
import 'package:restaurant_test/core/util/extensions/extensions.dart';
import 'package:restaurant_test/features/common/presentation/widgets/scale_animation_widget.dart';
import 'package:restaurant_test/features/tables/domain/entities/food_entity.dart';
import 'package:restaurant_test/features/tables/presentation/blocs/menus/menus_bloc.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
    required this.food,
  });

  final FoodEntity food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.gray.gray200),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.gray.gray100, width: 6),
              image: DecorationImage(
                image: AssetImage(food.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: context.textTheme.titleMedium,
                ),
                const Gap(4),
                Text(
                  food.description,
                  style: context.textTheme.titleSmall!.copyWith(color: AppColors.gray.gray400),
                ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${food.price}',
                      style: context.textTheme.headlineLarge,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.gray.gray100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          ScaleAnimationWidget(
                            onTap: () {
                              context.read<MenusBloc>().add(RemoveFromCard(food));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.remove_rounded,
                                color: AppColors.blue.blue400,
                              ),
                            ),
                          ),
                          const Gap(4),
                          BlocBuilder<MenusBloc, MenusState>(
                            builder: (context, state) {
                              return Text(
                                state.cartList
                                    .firstWhere((element) => element.id == food.id, orElse: () => const FoodEntity())
                                    .amount
                                    .toString(),
                                style: context.textTheme.headlineLarge!.copyWith(
                                  color: state.cartList.any((element) => element.id == food.id,) ?  AppColors.blue.blue500 :  AppColors.blue.blue300,
                                ),
                              );
                            },
                          ),
                          const Gap(4),
                          ScaleAnimationWidget(
                            onTap: () {
                              context.read<MenusBloc>().add(AddToCart(food));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.add_rounded,
                                color: AppColors.blue.blue400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
