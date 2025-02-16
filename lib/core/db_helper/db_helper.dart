import 'dart:io';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  late final Database database;

  final String databaseName = 'r_e.db';
  final int databaseVersion = 1;

  final String tableTables = 'tableTables';
  final String tableOrders = 'tableOrders';
  final String tableOrderProducts = 'tableOrderProducts';
  final String tableFoodCategory = 'tableFoodCategory';
  final String tableFood = 'tableFood';

  Future<void> init() async {
    late String databasesPath;
    if (Platform.isAndroid) {
      databasesPath = await getDatabasesPath();
    } else {
      var platformPath = await getLibraryDirectory();
      databasesPath = platformPath.path;
    }
    var path = join(databasesPath, databaseName);
    database = await openDatabase(
      path,
      version: databaseVersion,
      onCreate: (db, version) {
        /// Create tables
        db.execute('''
          CREATE TABLE $tableTables (
            id INTEGER PRIMARY KEY,
            name TEXT
          )
        ''');

        /// Create orders table
        db.execute('''
          CREATE TABLE $tableOrders (
            id INTEGER PRIMARY KEY,
            tableId INTEGER,
            total int,
            isClose INTEGER DEFAULT 0,
            createdAt TEXT
          )
        ''');

        /// create order products table
        db.execute('''
          CREATE TABLE $tableOrderProducts (
            id INTEGER PRIMARY KEY,
            orderId INTEGER,
            foodId INTEGER,
            quantity INTEGER
          )
        ''');

        /// Create food table
        db.execute('''
          CREATE TABLE $tableFood (
          id INTEGER PRIMARY KEY,
          categoryId INTEGER ,
          name TEXT ,
          description TEXT,
          price INTEGER,
          image TEXT
          )
        ''');

        /// Create food category table
        db.execute('''
          CREATE TABLE $tableFoodCategory (
            id INTEGER PRIMARY KEY,
            name TEXT
          )
        ''');



        /// Adding dummy data to the tables
        _addTables(db);
        _addFoodCategories(db);
        _addFoods(db);
      },
    );
  }

  void _addTables(Database db) {
    for (var i = 1; i < 21; i++) {
      db.insert(tableTables, {
        'id': i,
        'name': 'A0${i > 10 ? i : '0$i'}',
      });
    }
  }

  void _addFoodCategories(Database db) {
    db.insert(tableFoodCategory, {
      'id': 1,
      'name': 'Main Course',
    });
    db.insert(tableFoodCategory, {
      'id': 2,
      'name': 'Appetizers',
    });
    db.insert(tableFoodCategory, {
      'id': 3,
      'name': 'Beverages',
    });
    db.insert(tableFoodCategory, {
      'id': 4,
      'name': 'Desserts',
    });
  }

  void _addFoods(Database db) {
    // Main Course
    db.insert(tableFood, {
      'id': 1,
      'categoryId': 1,
      'name': 'Grilled Chicken',
      'description': 'Grilled chicken with vegetables',
      'price': 20,
      'image': 'assets/images/chicken.jpeg',
    });
    db.insert(tableFood, {
      'id': 2,
      'categoryId': 1,
      'name': 'Grilled Beef',
      'description': 'Grilled beef with vegetables',
      'price': 30,
      'image': 'assets/images/meat.jpeg',
    });

    // Appetizers
    db.insert(tableFood, {
      'id': 3,
      'categoryId': 2,
      'name': 'Egg Salad',
      'description': 'Appetizer with egg',
      'price': 8,
      'image': 'assets/images/egg.jpeg',
    });
    db.insert(tableFood, {
      'id': 4,
      'categoryId': 2,
      'name': 'Apple Pie',
      'description': 'Apple pie with ice cream',
      'price': 12,
      'image': 'assets/images/apple.jpeg',
    });

    // Beverages
    db.insert(tableFood, {
      'id': 5,
      'categoryId': 3,
      'name': 'Coke',
      'description': 'Good old coke',
      'price': 7,
      'image': 'assets/images/coke.jpeg',
    });
    db.insert(tableFood, {
      'id': 6,
      'categoryId': 3,
      'name': 'Pepsi',
      'description': 'Good old pepsi',
      'price': 4,
      'image': 'assets/images/bev1.jpeg',
    });

    // Desserts
    db.insert(tableFood, {
      'id': 7,
      'categoryId': 4,
      'name': 'Chocolate Cake',
      'description': 'Chocolate cake with ice cream',
      'price': 6,
      'image': 'assets/images/cake.jpeg',
    });
    db.insert(tableFood, {
      'id': 8,
      'categoryId': 4,
      'name': 'Cheese Cake',
      'description': 'Cheese cake with ice cream',
      'price': 10,
      'image': 'assets/images/cheese.jpeg',
    });
  }
}

// Future<void> saveToWordEntity(List<WordModel> wordDBO) async {
//   try {
//     if (database.isOpen) {
//       for (var element in wordDBO) {
//         await database.insert(tableWordEntity, element.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
//       }
//     }
//   } catch (e) {
//     log("saveToWordEntity", error: e.toString());
//   }
// }
//

//
//
// Future<void> deleteAllWordBank() async {
//   try {
//     if (database.isOpen) {
//       await database.delete(tableWordBank);
//     }
//   } catch (e) {
//     log("deleteAllWordBank", error: e.toString());
//   }
// }
