import 'package:cookee_api/contracts/api_core_repo_contract.dart';
import 'package:cookee_api/contracts/http_api_execute_service.dart';
import 'package:cookee_api/enums/app_api_type_enum.dart';

class ApiCoreRepo extends HttpApiExecuteService implements ApiCoreRepoContract {
  /*
      Core Api Functions
    */

  @override
  Future<Map<String, dynamic>> getExecute(Map<String, String> headers, String url) async {
    return await executeRequestApi(headers, url, {}, AppApiType.get);
  }

  @override
  Future<Map<String, dynamic>> postExecute(Map<String, String> headers, String url, Map<String, dynamic> body) async {
    return await executeRequestApi(headers, url, body, AppApiType.post);
  }

  @override
  Future<Map<String, dynamic>> postJsonExecute(
      Map<String, String> headers, String url, Map<String, dynamic> body) async {
    return await executeRequestApi(headers, url, body, AppApiType.postJson);
  }

  @override
  Future<Map<String, dynamic>> getCompressExecute(Map<String, String> headers, String url) async {
    return await executeRequestApi(headers, url, {}, AppApiType.getCompress);
  }

  @override
  Future<Map<String, dynamic>> postCompressExecute(
      Map<String, String> headers, String url, Map<String, dynamic> body) async {
    return await executeRequestApi(headers, url, body, AppApiType.postCompress);
  }

  @override
  Future<bool> apiCheckInternetConnectionMeta() async {
    return await apiCheckInternetConnection();
  }

  @override
  Future<Map<String, dynamic>> postJsonCompressExecute(
      Map<String, String> headers, String url, Map<String, dynamic> body) async {
    return await executeRequestApi(headers, url, body, AppApiType.postJsonCompress);
  }
}
