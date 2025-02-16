part of 'tables_bloc.dart';

class TablesState extends Equatable {
  final FormzSubmissionStatus status;
  final List<TableEntity> tables;

  const TablesState({
    this.status = FormzSubmissionStatus.initial,
    this.tables = const [],
  });


  TablesState copyWith({
    FormzSubmissionStatus? status,
    List<TableEntity>? tables,
  }) {
    return TablesState(
      status: status ?? this.status,
      tables: tables ?? this.tables,
    );
  }

  @override
  List<Object?> get props => [
        status,
        tables,
      ];
}
