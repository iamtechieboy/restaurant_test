import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_test/core/config/app_colors.dart';
import 'package:restaurant_test/core/util/extensions/extensions.dart';
import 'package:restaurant_test/features/tables/presentation/blocs/tables/tables_bloc.dart';

import '../widgets/table_item_widget.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TablesBloc>().add(GetTablesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TablesBloc, TablesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Main', style: context.textTheme.displaySmall),
            shadowColor: AppColors.gray.gray100,
            elevation: .5,
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 100,
            ),
            itemBuilder: (context, index) {
              final table = state.tables[index];
              return TableItem(tableEntity: table);
            },
            itemCount: state.tables.length,
          ),
        );
      },
    );
  }
}
