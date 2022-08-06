import 'package:cookee_api/constants/core_constants.dart';
import 'package:cookee_api/contracts/api_app_profile_repo_contract.dart';
import 'package:cookee_api/repo/api_app_repo.dart';

class ApiAppProfileRepo extends ApiAppRepo implements ApiAppProfileRepoContract {
  @override
  Future<Map<String, dynamic>> getProfileExecute(String url, Map<String, String> headers) async {
    headers.addAll(getGeneralHeaders());
    return await getExecute(headers, url);
  }

  @override
  Future<Map<String, dynamic>> postProfileExecute(
      String url, Map<String, dynamic> body, Map<String, String> headers) async {
    headers.addAll(getGeneralHeaders());
    return await postExecute(headers, url, body);
  }

  @override
  Future<Map<String, dynamic>> postProfileJsonExecute(
      String url, Map<String, dynamic> body, Map<String, String> headers) async {
    headers.addAll(getGeneralHeaders());
    return await postJsonExecute(headers, url, body);
  }

  @override
  Future<Map<String, dynamic>> getProfileCompressedExecute(String url, Map<String, String> headers) async {
    headers.addAll(getGeneralHeaders());
    return await getCompressedExecute(headers, url);
  }

  @override
  Future<Map<String, dynamic>> postProfileCompressedExecute(
      String url, Map<String, dynamic> body, Map<String, String> headers) async {
    headers.addAll(getGeneralHeaders());
    return await postCompressedExecute(headers, url, body);
  }

  @override
  Future<Map<String, dynamic>> postProfileJsonCompressedExecute(
      String url, Map<String, dynamic> body, Map<String, String> headers) async {
    headers.addAll(getGeneralHeaders());
    return await postJsonCompressedExecute(headers, url, body);
  }

  @override
  Map<String, String> getGeneralHeaders() {
    return {
      WC_TOKKKEN_VALID_KEY: WC_PROFILE_TOKKEN_VALID,
    };
  }
}
