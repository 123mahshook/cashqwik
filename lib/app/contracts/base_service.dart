import 'package:cashqwik/app/config/app_module_container.dart';
import 'package:cashqwik/app/repositeries/api/app_api_repo.dart';
import 'package:cashqwik/app/repositeries/app/app_model.dart';
import 'package:cashqwik/core/config/module_container.dart';
import 'package:cashqwik/core/repositeries/app/main_model.dart';
import 'package:cashqwik/core/repositeries/preference/preference_repo.dart';
import 'package:cookee_api/repo/api_app_general_repo.dart';
import 'package:cookee_api/repo/api_appprofile_repo.dart';

abstract class BaseService {
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
  AppModel? appModel = AppModuleContainer.moduleInjector?.get<AppModel>();
  ApiAppGeneralRepo apiAppGeneralRepo = ApiAppGeneralRepo();
  ApiAppProfileRepo apiAppProfileRepo = ApiAppProfileRepo();
  AppApiRepo appApiRepo = AppApiRepo();
  PreferenceRepo prefRepo = PreferenceRepo();
}
