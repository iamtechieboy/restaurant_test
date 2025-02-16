import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_test/core/config/app_colors.dart';
import 'package:restaurant_test/core/routing/app_routing.dart';
import 'package:restaurant_test/core/service_locator.dart';
import 'package:restaurant_test/core/util/extensions/extensions.dart';
import 'package:restaurant_test/features/common/presentation/widgets/scale_animation_widget.dart';
import 'package:restaurant_test/features/orders/presentation/blocs/orders/orders_bloc.dart';
import 'package:restaurant_test/features/tables/domain/entities/food_entity.dart';
import 'package:restaurant_test/features/tables/domain/entities/table_entity.dart';
import 'package:restaurant_test/features/tables/presentation/blocs/table_single/table_single_bloc.dart';
import 'package:restaurant_test/features/tables/presentation/blocs/tables/tables_bloc.dart';

class TableSingleScreen extends StatefulWidget {
  const TableSingleScreen({
    super.key,
    required this.tableEntity,
  });

  final TableEntity tableEntity;

  @override
  State<TableSingleScreen> createState() => _TableSingleScreenState();
}

class _TableSingleScreenState extends State<TableSingleScreen> {
  late final TableSingleBloc tableSingleBloc;

  @override
  void initState() {
    tableSingleBloc = TableSingleBloc(
      getTableUseCase: serviceLocator(),
      createOrderUseCase: serviceLocator(),
      closeOrderUseCase: serviceLocator(),
      updateOrderUseCase: serviceLocator(),
    )..add(InitBloc(widget.tableEntity));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: tableSingleBloc,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<TableSingleBloc, TableSingleState>(
            builder: (context, state) {
              return Text(
                'Table ${state.tablesEntity.name}',
                style: context.textTheme.displaySmall,
              );
            },
          ),
          shadowColor: AppColors.gray.gray100,
          elevation: .5,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.gray.gray400,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: BlocBuilder<TableSingleBloc, TableSingleState>(
          builder: (context, state) {
            if (state.tablesEntity.isAvailable) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.table_bar_outlined,
                      color: AppColors.gray.gray400,
                      size: 72,
                    ),
                    Text(
                      'Table is empty',
                      style: context.textTheme.displayLarge!.copyWith(
                        color: AppColors.gray.gray400,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.all(8),
                    shrinkWrap: true,
                    itemCount: state.orderProducts.length,
                    itemBuilder: (context, index) {
                      final orderProduct = state.orderProducts[index];
                      return ListTile(
                        visualDensity: VisualDensity.compact,
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(orderProduct.foodImage),
                        ),
                        title: Text(orderProduct.foodName),
                        subtitle: Text('\$${orderProduct.price} x ${orderProduct.quantity}'),
                        trailing: Text(
                          '',
                          style: context.textTheme.titleMedium,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: AppColors.gray.gray100,
                        thickness: 1,
                      );
                    },
                  ),
                  const Gap(16),
                  Divider(
                    color: AppColors.gray.gray100,
                    thickness: 1,
                  ),
                  const Gap(8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: context.textTheme.displaySmall,
                        ),
                        BlocBuilder<TableSingleBloc, TableSingleState>(
                          builder: (context, state) {
                            final total = state.orderProducts.fold<double>(
                              0,
                              (previousValue, element) => previousValue + (element.price * element.quantity),
                            );
                            return Text(
                              '\$${total.toStringAsFixed(2)}',
                              style: context.textTheme.displayMedium,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: BlocBuilder<TableSingleBloc, TableSingleState>(
          builder: (context, state) {
            return ScaleAnimationWidget(
              onTap: () {
                if (state.tablesEntity.isAvailable) {
                  context.pushNamed(AppRouter.menus).then((value) {
                    if (value != null) {
                      tableSingleBloc.add(
                        CreateOrder(
                          foods: value as List<FoodEntity>,
                          callback: () {
                            context.read<TablesBloc>().add(GetTablesEvent());
                            context.read<OrdersBloc>().add(OrdersGetEvent());
                          },
                        ),
                      );
                    }
                  });
                } else {
                  tableSingleBloc.add(CloseOrder(callback: () {
                    context.pop('Order closed');
                  }));
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.tablesEntity.isAvailable ? 'New order' : 'Close order',
                        style: context.textTheme.headlineLarge!.copyWith(color: AppColors.white)),
                    const Gap(4),
                    state.tablesEntity.isAvailable
                        ? const Icon(
                            Icons.add_rounded,
                            color: AppColors.white,
                            size: 18,
                          )
                        : const Icon(
                            Icons.close_rounded,
                            color: AppColors.white,
                            size: 18,
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
