import 'package:cookee_api/constants/core_constants.dart';
import 'package:cookee_api/contracts/api_app_general_repocontract.dart';
import 'package:cookee_api/repo/api_app_repo.dart';

class ApiAppGeneralRepo extends ApiAppRepo implements ApiAppGeneralRepoContract {
  @override
  Future<Map<String, dynamic>> getProfileExecute(String url) async {
    return await getExecute(getGeneralHeaders(), url);
  }

  @override
  Future<Map<String, dynamic>> postProfileExecute(String url, Map<String, dynamic> body) async {
    return await postExecute(getGeneralHeaders(), url, body);
  }

  @override
  Future<Map<String, dynamic>> postProfileJsonExecute(String url, Map<String, dynamic> body) async {
    return await postJsonExecute(getGeneralHeaders(), url, body);
  }

  @override
  Future<Map<String, dynamic>> getProfileCompressedExecute(String url) async {
    return await getCompressedExecute(getGeneralHeaders(), url);
  }

  @override
  Future<Map<String, dynamic>> postProfileCompressedExecute(String url, Map<String, dynamic> body) async {
    return await postCompressedExecute(getGeneralHeaders(), url, body);
  }

  @override
  Future<Map<String, dynamic>> postProfileJsonCompressedExecute(String url, Map<String, dynamic> body) async {
    return await postJsonCompressedExecute(getGeneralHeaders(), url, body);
  }

  @override
  Map<String, String> getGeneralHeaders() {
    return {WC_TOKKKEN_VALID_KEY: WC_LOGIN_TOKKEN_VALID};
  }
}
