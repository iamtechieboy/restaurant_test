import 'package:restaurant_test/core/db_helper/db_helper.dart';
import 'package:restaurant_test/features/tables/data/models/categories_model.dart';
import 'package:restaurant_test/features/tables/data/models/food_model.dart';
import 'package:restaurant_test/features/tables/data/models/order_product_model.dart';
import 'package:restaurant_test/features/tables/data/models/tables_model.dart';

abstract class TablesLocalDataSource {
  Future<List<TablesModel>> getTables();

  Future<List<OrderProductModel>> getTableOrderDetails(int orderId);

  Future<List<CategoriesModel>> getCategories();
}

class TablesLocalDataSourceImpl implements TablesLocalDataSource {
  final DBHelper dbHelper;

  TablesLocalDataSourceImpl(this.dbHelper);

  @override
  Future<List<OrderProductModel>> getTableOrderDetails(int orderId) async {
    var response = await dbHelper.database.rawQuery('''
    SELECT 
      op.id, 
      op.orderId, 
      op.quantity, 
      f.name AS foodName, 
      f.price AS price, 
      f.description AS foodDescription, 
      f.image AS foodImage
    FROM ${dbHelper.tableOrderProducts} op
    JOIN ${dbHelper.tableFood} f ON op.foodId = f.id
    WHERE op.orderId = ?
  ''', [orderId]);

    List<OrderProductModel> orderProductsList = response.map((e) => OrderProductModel.fromJson(e)).toList();
    return orderProductsList;
  }

  @override
  Future<List<TablesModel>> getTables() async {
    var response = await dbHelper.database.rawQuery('''
    SELECT 
      t.id, 
      t.name, 
      o.id AS orderId
    FROM ${dbHelper.tableTables} t
    LEFT JOIN ${dbHelper.tableOrders} o ON t.id = o.tableId AND o.isClose = 0
    ''');
    List<TablesModel> tablesList = response.map((e) => TablesModel.fromJson(e)).toList();
    return tablesList;
  }

  @override
  Future<List<CategoriesModel>> getCategories() async {
    List<CategoriesModel> categoriesList = [];
    final result = await dbHelper.database.rawQuery("SELECT * FROM ${dbHelper.tableFoodCategory}");
    for (var item in result) {
      final temp = CategoriesModel.fromJson(item);
      final foodResult =
          await dbHelper.database.rawQuery("SELECT * FROM ${dbHelper.tableFood} WHERE categoryId = ${temp.id}");
      final foods = foodResult.map((e) => FoodModel.fromJson(e)).toList();
      categoriesList.add(CategoriesModel(
        id: temp.id,
        name: temp.name,
        foods: foods,
      ));
    }

    return categoriesList;
  }
}
