const tableCart = "cart";

const tableCartCreate =
    "CREATE TABLE $tableCart (id INTEGER PRIMARY KEY AUTOINCREMENT,storeId TEXT,itemId TEXT,quantity INTEGER DEFAULT 1,variantId TEXT DEFAULT '');";
