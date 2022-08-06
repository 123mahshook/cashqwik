import 'dart:io' as io;
import 'package:cookee_sqlite/Constants/constant_create_tables.dart';
import 'package:cookee_sqlite/Constants/constant_main.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
 static final DatabaseHelper _instance = DatabaseHelper.internal();

 factory DatabaseHelper() => _instance;
 static Database? _db;

 DatabaseHelper.internal();

 initDb() async {
   io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
   String path = join(documentsDirectory.path, dbName);
   _db = await openDatabase(path, version: dbVersion, onCreate: onCreate);
 }

 Database? get db {
   return _db;
 }




 void onCreate(Database db, int version) async {
   // When creating the db, create the table
   try{
          ///Create Tables
          for(var cr in defaultCreates){
                await db.execute(
                      cr
                  );
            }
          

    }
  catch(_){}  
   
 }
}