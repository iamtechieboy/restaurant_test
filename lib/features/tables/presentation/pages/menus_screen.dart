import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_test/core/config/app_colors.dart';
import 'package:restaurant_test/core/service_locator.dart';
import 'package:restaurant_test/core/util/extensions/extensions.dart';
import 'package:restaurant_test/features/common/presentation/widgets/scale_animation_widget.dart';
import 'package:restaurant_test/features/tables/domain/entities/food_entity.dart';
import 'package:restaurant_test/features/tables/presentation/blocs/menus/menus_bloc.dart';
import 'package:restaurant_test/features/tables/presentation/widgets/food_item_widget.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

class MenusWidget extends StatefulWidget {
  const MenusWidget({
    super.key,
  });

  @override
  State<MenusWidget> createState() => _MenusWidgetState();
}

class _MenusWidgetState extends State<MenusWidget> {
  late final MenusBloc menusBloc;

  @override
  void initState() {
    menusBloc = MenusBloc(getCategoriesUseCase: serviceLocator())..add(GetCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: menusBloc,
      child: Scaffold(
        backgroundColor: AppColors.gray.gray100,
        appBar: AppBar(
          title: Text(
            'Menus',
            style: context.textTheme.displaySmall,
          ),
          elevation: .1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.gray.gray400,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: BlocBuilder<MenusBloc, MenusState>(
          builder: (context, state) {
            return ScrollableListTabScroller(
              itemCount: state.categories.length,
              headerContainerBuilder: (context, child) {
                return Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: child,
                );
              },
              tabBuilder: (BuildContext context, int index, bool active) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: active ? AppColors.blue.blue100 : null,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.blue.blue300),
                ),
                child: Text(
                  state.categories[index].name,
                  style: context.textTheme.titleSmall!.copyWith(color: AppColors.blue.blue400),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(
                bottom: kBottomNavigationBarHeight + context.padding.bottom + 16,
              ),
              itemBuilder: (BuildContext context, int index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.categories[index].name,
                    style: context.textTheme.headlineLarge,
                  ),
                  ...state.categories[index].foods.map(
                    (food) {
                      return FoodItem(food: food);
                    },
                  ),
                ],
              ),
            );
          },
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14).copyWith(
            bottom: context.padding.bottom + 8,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              top: BorderSide(color: AppColors.gray.gray200),
            ),
          ),
          child: BlocBuilder<MenusBloc, MenusState>(
            builder: (context, state) {
              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 48,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.blue.blue400),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.shopping_basket_rounded,
                          size: 16,
                          color: AppColors.blue.blue400,
                        ),
                        const Gap(4),
                        Text(
                          "${totalCount(state.cartList)}",
                          style: context.textTheme.headlineLarge!.copyWith(
                            color: AppColors.blue.blue400,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: ScaleAnimationWidget(
                      onTap: () {
                        context.pop(state.cartList);
                      },
                      child: Container(
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.blue.blue400,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\$ ${totalSum(state.cartList)}",
                              style: context.textTheme.displaySmall!.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              "Create order",
                              style: context.textTheme.headlineLarge!.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: AppColors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  int totalSum(List<FoodEntity> cartList) {
    var sum = 0;
    for (var i = 0; i < cartList.length; i++) {
      sum += (cartList[i].price * cartList[i].amount);
    }
    return sum;
  }

  totalCount(List<FoodEntity> cartList) {
    var count = 0;
    for (var i = 0; i < cartList.length; i++) {
      count += cartList[i].amount;
    }
    return count;
  }
}
