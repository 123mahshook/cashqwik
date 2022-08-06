import 'package:cookee_sqlite/Config/db_helper.dart';
import 'package:cookee_sqlite/Constants/constant_create_tables.dart';
import 'package:cookee_sqlite/Constants/constant_tables.dart';

class RawDbRepo {
  DatabaseHelper? databaseHelper;

  ////////////////////////
  /*** Project General ***/
  ////////////////////////

  /*Truncate All Tables*/
  Future<void> dbTruncateAllTables() async {
    var tables = defaultTables;
    for (var table in tables) {
      await dbTruncateTableData(table);
    }
  }

  /*Truncate All Tables*/
  Future<void> dbDropsAllTables() async {
    var tables = defaultTables;
    for (var table in tables) {
      await dbDropTable(table);
    }
  }

  /*Truncate All Tables*/
  Future<void> dbCreateAllTables() async {
    try {
      try {
        ///Config Table
        for (var cr in defaultCreates) {
          await databaseHelper!.db!.execute(cr);
        }
      } catch (_) {}
    } catch (_) {}
  }

  /////////////////////
  /*** DB General ***/
  ////////////////////

  /*Meta Data Get Table Data All*/
  Future<List<Map>> dbGetTableDataAll(String tableName) async {
    try {
      List<Map> list =
          await databaseHelper!.db!.rawQuery("Select * from $tableName", []);
      return list;
    } catch (_) {}
    return [];
  }

  /*Meta Data Get Table Data Row*/
  Future<Map<String, dynamic>?> dbGetTableDataRow(
      String tableName, String id) async {
    try {
      List<Map<String, dynamic>> list = await databaseHelper!.db!
          .rawQuery("Select * from $tableName WHERE id = ?", [id]);
      if (list.isNotEmpty) {
        return list[0];
      }
    } catch (_) {}
  }

  /*Meta Data Get Table Data Row*/
  Future<Map?> dbGetTableDataRowServerId(String tableName, String id) async {
    try {
      List<Map> list = await databaseHelper!.db!
          .rawQuery("Select * from $tableName WHERE server_id = ?", [id]);
      if (list.isNotEmpty) {
        return list[0];
      }
    } catch (_) {}
  }

  /*Meta Data Get Table Data Row*/
  Future<Map?> dbGetTableDataRowKeyValue(
      String tableName, String key, String value) async {
    try {
      List<Map> list = await databaseHelper!.db!
          .rawQuery("Select * from $tableName WHERE $key = ?", [value]);
      if (list.isNotEmpty) {
        return list[0];
      }
    } catch (_) {}
  }

  /*Meta Data Get Table Data Row*/
  Future<List<Map>> dbGetTableDataListKeyValue(
      String tableName, String key, String value) async {
    List<Map> list = [];
    try {
      list = await databaseHelper!.db!
          .rawQuery("Select * from $tableName WHERE $key = ?", [value]);
      return list;
    } catch (_) {}
    return [];
  }

  /*Meta Data Delete Table Data*/
  dbDeleteTableData(String tableName, String id) async {
    try {
      await databaseHelper!.db!
          .delete(tableName, where: "id = ?", whereArgs: [id]);
    } catch (_) {}
  }

  /*Meta Data Update Table Data*/
  Future<int> dbInsertTableData(
      String tableName, Map<String, dynamic> data) async {
    int id = 0;
    try {
      id = await databaseHelper!.db!.insert(tableName, data);
    } catch (_) {}
    return id;
  }

  /*Meta Data Update Table Data*/
  Future<int> dbUpdateTableData(
      String tableName, String id, Map<String, dynamic> data) async {
    int retId = 0;
    try {
      await databaseHelper!.db!
          .update(tableName, data, where: "id = ?", whereArgs: [id]);
      retId = int.parse(id);
    } catch (_) {}
    return retId;
  }

  /*Meta Data Update Table Data*/
  Future<int> dbUpdateTableDataSererId(
      String tableName, String id, Map<String, dynamic> data) async {
    int retId = 0;
    try {
      await databaseHelper!.db!
          .update(tableName, data, where: "server_id = ?", whereArgs: [id]);
      retId = int.parse(id);
    } catch (_) {}
    return retId;
  }

  /*Meta Data Get Table Data All*/
  Future<void> dbTruncateTableData(String tableName) async {
    try {
      await databaseHelper!.db!.rawQuery("DELETE from $tableName", []);
    } catch (_) {}
  }

  /* Drop Table */
  dbDropTable(String tableName) async {
    try {
      await databaseHelper!.db!.execute("DROP TABLE IF EXISTS $tableName");
    } catch (e) {
      //print(e);
    }
  }

  /* Meta -  data Make Synced(Switching sync status 0 - 1) */
  dbInsertServerId(String tableName, String serverId, String id) async {
    try {
      Map<String, dynamic> data = {'server_id': serverId};
      await databaseHelper!.db!
          .update(tableName, data, where: "id = ?", whereArgs: [id]);
    } catch (_) {}
  }

  /*Meta Data Delete Table Data*/
  dbDeleteTableDataKeyValue(String tableName, String key, String value) async {
    try {
      await databaseHelper!.db!
          .delete(tableName, where: "$key = ?", whereArgs: [value]);
    } catch (_) {}
  }

  /*Meta Data Get Table Data All*/
  Future<List<Map>> dbExecuteQuery(String query) async {
    try {
      List<Map> list = await databaseHelper!.db!.rawQuery(query, []);
      return list;
    } catch (_) {}
    return [];
  }
}
