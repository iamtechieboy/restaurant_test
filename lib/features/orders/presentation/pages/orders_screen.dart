import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_test/core/config/app_colors.dart';
import 'package:restaurant_test/core/util/extensions/extensions.dart';
import 'package:restaurant_test/features/orders/presentation/blocs/orders/orders_bloc.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late OrdersBloc ordersBloc;

  @override
  void initState() {
    super.initState();
    ordersBloc = context.read<OrdersBloc>()..add(OrdersGetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: context.textTheme.displaySmall,
        ),
        elevation: .1,
        shadowColor: AppColors.gray.gray100,
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          return state.status.isInProgress
              ? const Center(child: CircularProgressIndicator())
              : state.status.isSuccess
                  ? state.ordersList.isNotEmpty
                      ? ListView.separated(
                          itemCount: state.ordersList.length,
                          itemBuilder: (context, index) {
                            final order = state.ordersList[index];
                            return ListTile(
                              visualDensity: VisualDensity.compact,
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order number: #${order.id.toString()}',
                                    style: context.textTheme.headlineLarge,
                                  ),
                                  Text(
                                    'Total: \$${order.total.toString()}',
                                    style: context.textTheme.headlineLarge,
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Table: ${order.tableName}',
                                    style: context.textTheme.headlineMedium!.copyWith(
                                      color: AppColors.gray.gray400,
                                    ),
                                  ),
                                  Text(
                                    order.isClosed ? 'Closed' : 'Open',
                                    style: context.textTheme.headlineMedium!.copyWith(
                                      color: order.isClosed ? AppColors.gray.gray400 : AppColors.blue.blue400,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        )
                      : Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.receipt_outlined,
                                size: 48,
                                color: AppColors.gray.gray400,
                              ),
                              const Gap(8),
                              Text(
                                'No orders found',
                                style: context.textTheme.displayMedium!.copyWith(
                                  color: AppColors.gray.gray400,
                                ),
                              ),
                            ],
                          ),
                        )
                  : const Center(
                      child: Text('Failed to load orders'),
                    );
        },
      ),
    );
  }
}
