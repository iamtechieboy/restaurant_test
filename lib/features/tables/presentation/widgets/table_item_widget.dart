import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_test/core/config/app_colors.dart';
import 'package:restaurant_test/core/routing/app_routing.dart';
import 'package:restaurant_test/core/util/extensions/extensions.dart';
import 'package:restaurant_test/features/common/presentation/widgets/scale_animation_widget.dart';
import 'package:restaurant_test/features/orders/presentation/blocs/orders/orders_bloc.dart';
import 'package:restaurant_test/features/tables/domain/entities/table_entity.dart';
import 'package:restaurant_test/features/tables/presentation/blocs/tables/tables_bloc.dart';

class TableItem extends StatelessWidget {
  const TableItem({
    super.key,
    required this.tableEntity,
  });

  final TableEntity tableEntity;

  @override
  Widget build(BuildContext context) {
    return ScaleAnimationWidget(
      onTap: () {
        context.pushNamed(AppRouter.tableSingle, extra: tableEntity).then(
          (value) {
            if (value != null && context.mounted) {
              context.read<TablesBloc>().add(GetTablesEvent());
              context.read<OrdersBloc>().add(OrdersGetEvent());
            }
          },
        );
      },
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          border: tableEntity.isAvailable ? Border.all(color: AppColors.blue.blue300, width: 1.5) : null,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tableEntity.name,
                style: context.textTheme.titleLarge!.copyWith(
                  color: tableEntity.isAvailable ? AppColors.blue.blue400 : null,
                ),
              ),
              if (tableEntity.isAvailable) ...[
                const Gap(6),
                Icon(
                  Icons.add_rounded,
                  color: AppColors.blue.blue400,
                  size: 16,
                )
              ] else ...[
                Text(
                  'Order: #${tableEntity.orderId.toString()}',
                  style: context.textTheme.titleMedium!.copyWith(
                    color: AppColors.gray.gray400,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
