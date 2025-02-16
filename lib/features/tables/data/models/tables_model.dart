import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_test/features/tables/domain/entities/table_entity.dart';

part 'tables_model.g.dart';

@JsonSerializable()
class TablesModel {
  final int id;
  final String name;
  final int orderId;


  TablesModel({
    this.id = 0,
    this.name = "",
    this.orderId = 0,
  });

  factory TablesModel.fromJson(Map<String, dynamic> json) => _$TablesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TablesModelToJson(this);

  TableEntity toEntity() {
    return TableEntity(
      id: id,
      name: name,
      orderId: orderId,
    );
  }

  factory TablesModel.fromEntity(TableEntity entity) {
    return TablesModel(
      id: entity.id,
      name: entity.name,
      orderId: entity.orderId,
    );
  }
}
