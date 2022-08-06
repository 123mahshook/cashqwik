import 'package:cashqwik/app/contracts/base_repo.dart';
import 'package:cookee_api/constants/core_constants.dart';
import 'package:cookee_api/constants/messages.dart';
import 'package:cookee_api/repo/api_app_general_repo.dart';
import 'package:cookee_api/repo/api_appprofile_repo.dart';

class AppApiRepo extends BaseRepo {
  ApiAppGeneralRepo apiGeneralRepo = ApiAppGeneralRepo();
  ApiAppProfileRepo apiProfileRepo = ApiAppProfileRepo();
  final Map<String, dynamic> _resErrorBody = {
    "status": false,
    "message": MS_SERVER_ERROR
  };

//Check Server

  /*Future<ApiActionStatusMessageModel> checkServerApi() async {
    try {
      return ApiActionStatusMessageModel.fromJson(
          await apiGeneralRepo.getProfileExecute(checkServerUrl));
    } catch (_) {}
    return ApiActionStatusMessageModel.fromJson(_resErrorBody);
  }*/

//Auth Check Phone

  /*Future<ApiAuthCheckPhoneModel> authCheckPhoneApi(
      Map<String, dynamic> body) async {
    try {
      return ApiAuthCheckPhoneModel.fromJson(
          await apiGeneralRepo.postProfileJsonExecute(authCheckPhoneUrl, body));
    } catch (_) {}
    return ApiAuthCheckPhoneModel.fromJson(_resErrorBody);
  }*/

  Map<String, String> getProfileHeader() {
    return {
      WC_ACCESS_TOKKEN_KEY: mainModel!.userTokken,
      WC_USER_ID_KEY: mainModel!.userId,
    };
  }
}
