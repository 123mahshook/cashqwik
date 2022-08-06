import 'package:cashqwik/app/config/app_module_container.dart';
import 'package:cashqwik/app/repositeries/app/app_model.dart';
import 'package:cashqwik/core/config/module_container.dart';
import 'package:cashqwik/core/constants/messages.dart';
import 'package:cashqwik/core/repositeries/app/main_model.dart';
import 'package:cashqwik/utility/common/common_navigate.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? parentContext;
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
  AppModel? appModel = AppModuleContainer.moduleInjector?.get<AppModel>();

  void setContext(BuildContext context) {
    this.parentContext = context;
  }

  void dispose();

  void handleFailledRequest(String message) {
    if (message == MS_NO_INTERNET_CONNECTION) {
      CommonNavigate(parentContext: this.parentContext!).navigateNoInternet();
    } else if (message == MS_SERVER_ERROR) {
      CommonNavigate(parentContext: this.parentContext!).navigateServerError();
    } else {
      CommonNavigate(parentContext: this.parentContext!).navigateSplashScreen();
    }
  }
}
