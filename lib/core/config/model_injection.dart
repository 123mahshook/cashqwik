/* import 'dart:async';
import 'package:grocery_app/ScopedModel/main_model.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class ModelInjector {
  static MainModel _mainModel = MainModel();
  static Injector modelInjector;

  static Future initInjection() async {
    modelInjector = Injector.getInjector();
    modelInjector.map<MainModel>((injector) => _mainModel, isSingleton: true);
  }
}
 */