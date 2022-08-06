import 'package:cookee_common/Services/convert_service.dart';
import 'package:cookee_sqlite/Config/db_helper.dart';
import 'package:cashqwik/app/config/app_module_container.dart';
import 'package:cashqwik/app/constants/db_config_constants.dart';
import 'package:cashqwik/app/models/db_models/db_cart_item_model.dart';
import 'package:cookee_sqlite/Contracts/base_db_base_contract.dart';

class CartRepo extends BaseDbBaseContract<DbCartItemModel> {
  CartRepo() {
    databaseHelper = AppModuleContainer.moduleInjector?.get<DatabaseHelper>();
    tableCreate = tableCartCreate;
    tableName = tableCart;
  }

  @override
  Future<List<DbCartItemModel>> getDataModel() async {
    try {
      List<Map> list = await getData();
      return DbCartItemModel.parseItems(list);
    } catch (_) {}
    return [];
  }

  @override
  Future<DbCartItemModel?> getRowModel(String id) async {
    DbCartItemModel? itemRow = DbCartItemModel.initData();
    try {
      Map<String, dynamic>? row = await getRow(id);
      if (row != null) {
        //return DbCartItemModel.parseItem(row);
        itemRow = DbCartItemModel.parseItem(row);
      }
    } catch (_) {}
    return itemRow;
  }

  @override
  insertData(DbCartItemModel data) async {
    try {
      if (data.id! > 0) {
        return await insertDataRaw(data.toJsonDb(), data.id!);
      } else {
        return await insertDataRaw(data.toJsonDb(), 0);
      }
    } catch (_) {}
    return -1;
  }

  @override
  deleteData(DbCartItemModel data) async {
    try {
      if (data.id! > 0) {
        return await deleteRow(ConvertService.convertString(data.id!));
      }
    } catch (_) {}
    return -1;
  }

  @override
  makeEmpty() async {
    try {
      return await truncateTable();
    } catch (_) {}
    return -1;
  }

  Future<List<DbCartItemModel>> getCartItems() async {
    try {
      List<DbCartItemModel> fullData = await getDataModel();
      return fullData;
    } catch (_) {}
    return [];
  }
}
