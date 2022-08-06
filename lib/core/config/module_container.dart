import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:cashqwik/core/repositeries/app/main_model.dart';

class ModuleContainer {
  static Injector? moduleInjector;
  static Future<Injector?> initialise(Injector injector) async {
    moduleInjector = injector;
    moduleInjector?.map<MainModel>((injector) => MainModel(),
        isSingleton: true);
    return moduleInjector;
  }
}
