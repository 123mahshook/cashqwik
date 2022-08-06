import 'package:cashqwik/core/config/module_container.dart';
import 'package:cashqwik/core/repositeries/app/main_model.dart';
import 'package:cookee_prefs/Repositeries/preference_core_repo.dart';

abstract class PreferenceRepoContract {
  PreferenceCoreRepo prefCoreRepo = PreferenceCoreRepo();
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
}
