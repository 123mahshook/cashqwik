import 'package:cookee_sqlite/Contracts/base_db_contract.dart';

abstract class BaseDbBaseContract<T> extends BaseDbContract {
  /*
        Insert Data Model
      */
  insertData(T data);

  /*
        delete Data Model
      */
  deleteData(T data);

  /*
      make  empty data table
      */
  makeEmpty();

  /*
        Get Data Model
      */
  Future<List<T>> getDataModel();

  /*
        Get Row Model
      */
  Future<T?> getRowModel(String id);
}
