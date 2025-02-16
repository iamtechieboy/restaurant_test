import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:restaurant_test/core/usecases/base_usecase.dart';
import 'package:restaurant_test/features/tables/domain/entities/table_entity.dart';
import 'package:restaurant_test/features/tables/domain/use_cases/table_usecase.dart';
import 'package:restaurant_test/features/tables/domain/use_cases/tables_usecase.dart';

part 'tables_event.dart';

part 'tables_state.dart';

class TablesBloc extends Bloc<TablesEvent, TablesState> {
  final GetTablesUseCase getTablesUseCase;
  final GetTableUseCase getSingleTable;

  TablesBloc({
    required this.getTablesUseCase,
    required this.getSingleTable,
  }) : super(const TablesState()) {
    on<GetTablesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await getTablesUseCase(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          tables: result.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
