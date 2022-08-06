import 'package:cashqwik/core/constants/preference_config_constants.dart';
import 'package:cashqwik/core/repositeries/preference/contracts/preference_repo_contract.dart';

class PreferenceRepo extends PreferenceRepoContract {
  setUserTokken(String tokken) async {
    mainModel?.userTokken = "Token $tokken";
    await prefCoreRepo.setString(PF_USER_TOKKEN_KEY, tokken);
  }

  setUserId(String userId) async {
    mainModel?.userId = userId;
    await prefCoreRepo.setString(PF_USER_ID_KEY, userId);
  }

  Future<String> getUserTokken() async {
    String tokken = await prefCoreRepo.getString(PF_USER_TOKKEN_KEY);
    tokken = "Token " + tokken;
    mainModel?.userTokken = tokken;
    return tokken;
  }

  Future<String> getUserId() async {
    String userId = await prefCoreRepo.getString(PF_USER_ID_KEY);
    mainModel?.userId = userId;
    return userId;
  }
}
