import 'package:cookee_sqlite/Config/db_helper.dart';
import 'package:cookee_sqlite/Repositeries/raw_db_repo.dart';

abstract class BaseDbContract extends RawDbRepo{

      
      
      String tableName="";
      String tableCreate="";

     


      /*
        Create Table
      */
      createTable() async{
          try{
                await databaseHelper!.db!.execute(tableCreate);
              }
          catch(_){}
        }

      /*
        Drop Table
      */
      dropTable() async{
            await dbDropTable(tableName);
        }


      /*
        Truncate Table
      */
      truncateTable() async{
            await dbTruncateTableData(tableName);
        }


      /*
        Insert/Update Data Raw
      */
      Future<int> insertDataRaw(Map<String,dynamic> data,int id) async{
            if(id>0){
                  return await dbUpdateTableData(tableName, id.toString(), data);
              }
            else{
                  return await dbInsertTableData(tableName, data);
              }
        }


      /*
        Insert/Update Data Raw
      */
      Future<int> updateDataServerId(Map<String,dynamic> data,String id) async{
           return await dbUpdateTableDataSererId(tableName, id, data);
        }

      /*
        Get Data All
      */
      Future<List<Map>> getData()async{
          try{
              return await dbGetTableDataAll(tableName);
            }
          catch(_){}
          return [];
        }

      /*
        Get Data Row By Id
      */
      Future<Map<String,dynamic>?> getRow(String id) async{
          try{
                return await dbGetTableDataRow(tableName, id);
            }
          catch(_){}
        }

      
      /*
        Execute Query
      */
      Future<List<Map>> executeQuery(String query) async{
            return await dbExecuteQuery(query);
        }


      /*
        Delete Row
      */
      deleteRow(String id) async{
            await dbDeleteTableData(tableName, id);
        }


      /*
        Delete Row key/value
      */
      deleteRowKeyValue(String id,String key,String value) async{
            await dbDeleteTableDataKeyValue(tableName, key, value);
        }





      


     
  }