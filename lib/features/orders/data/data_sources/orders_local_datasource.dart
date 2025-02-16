import 'package:restaurant_test/core/db_helper/db_helper.dart';
import 'package:restaurant_test/core/util/params.dart';
import 'package:restaurant_test/features/orders/data/models/orders_model.dart';

abstract class OrdersLocalDataSource {
  Future<List<OrdersModel>> getOrders();

  Future<int> createOrder(OrderCreateParams params);

  Future<void> closeOrder(String orderId);

  Future<void> updateOrder(OrderUpdateParams params);
}

class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  final DBHelper dbHelper;

  OrdersLocalDataSourceImpl(this.dbHelper);

  @override
  Future<List<OrdersModel>> getOrders() async {
    final result = await dbHelper.database.rawQuery('''
      SELECT o.*, 
      t.name as tableName
      FROM ${dbHelper.tableOrders} o
      LEFT JOIN ${dbHelper.tableTables} t ON o.tableId = t.id
    ''');

    return result.map((e) => OrdersModel.fromJson(e)).toList();
  }

  @override
  Future<int> createOrder(OrderCreateParams params) async {
    var totalSum = 0;
    for (var item in params.food) {
      totalSum += item.amount * item.price;
    }

    /// create order first
    final orderId = await dbHelper.database.rawInsert(
        "INSERT INTO ${dbHelper.tableOrders} (tableId, total, createdAt) VALUES (${params.tableId}, $totalSum, '${DateTime.now().toIso8601String()}')");

    /// Add order products
    for (var item in params.food) {
      await dbHelper.database.rawInsert(
          "INSERT INTO ${dbHelper.tableOrderProducts} (orderId, foodId, quantity) VALUES ($orderId, ${item.id}, ${item.amount})");
    }

    return orderId;
  }

  @override
  Future<void> closeOrder(String orderId) {
    return dbHelper.database.rawUpdate("UPDATE ${dbHelper.tableOrders} SET isClose = 1 WHERE id = $orderId");
  }

  @override
  Future<void> updateOrder(OrderUpdateParams params) {
    return dbHelper.database
        .rawUpdate("UPDATE ${dbHelper.tableOrders} SET tableId = ${params.tableId} WHERE id = ${params.orderId}");
  }
}
