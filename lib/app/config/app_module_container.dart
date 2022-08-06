import 'package:cookee_sqlite/Config/db_helper.dart';
import 'package:cashqwik/app/repositeries/app/app_model.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class AppModuleContainer {
  static Injector? moduleInjector;
  static Future<Injector?> initialise(Injector injector) async {
    moduleInjector = injector;
    moduleInjector?.map<AppModel>((injector) => AppModel(), isSingleton: true);
    await DatabaseHelper().initDb();
    moduleInjector?.map<DatabaseHelper>((injector) => DatabaseHelper(),
        isSingleton: true);
    return moduleInjector;
  }
}
