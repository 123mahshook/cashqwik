import 'package:cookee_sqlite/Constants/constant_tables.dart';

const tableCartCreate =
    "CREATE TABLE $tableCart (id INTEGER PRIMARY KEY AUTOINCREMENT,storeId TEXT,itemId TEXT,quantity INTEGER DEFAULT 1,variantId TEXT DEFAULT '',addOns TEXT DEFAULT '',addOnsQty TEXT DEFAULT '');";

//Default Creates data
const defaultCreates = [tableCartCreate];
