import 'package:cashqwik/app/config/app_module_container.dart';
import 'package:cashqwik/app/repositeries/app/app_model.dart';
import 'package:cashqwik/core/config/module_container.dart';
import 'package:cashqwik/core/repositeries/app/main_model.dart';

abstract class BaseRepo {
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
  AppModel? appModel = AppModuleContainer.moduleInjector?.get<AppModel>();
}
