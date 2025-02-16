import 'package:equatable/equatable.dart';

class TableEntity extends Equatable {
  final int id;
  final String name;
  final int orderId;

  const TableEntity({
    this.id = -1,
    this.name = '',
    this.orderId = 0,
  });

  TableEntity copyWith({
    int? id,
    String? name,
    int? orderId,
  }) {
    return TableEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      orderId: orderId ?? this.orderId,
    );
  }

  bool get isAvailable => orderId == 0;

  @override
  List<Object?> get props => [
        id,
        name,
        orderId,
      ];
}
