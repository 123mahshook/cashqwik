import 'package:cookee_api/contracts/api_app_repo_contract.dart';
import 'package:cookee_api/repo/api_core_repo.dart';

abstract class ApiAppRepo implements ApiAppRepoContract {
  ApiCoreRepo apiCoreRepo = ApiCoreRepo();

  /****************************************************************/
  /****************************************************************/
  /******************General Call Functions ***********************/
  /****************************************************************/
  /****************************************************************/

  @override
  Future<Map<String, dynamic>> getExecute(Map<String, String> headers, String url) async {
    return await apiCoreRepo.getExecute(headers, url);
  }

  @override
  Future<Map<String, dynamic>> postExecute(Map<String, String> headers, String url, Map<String, dynamic> body) async {
    return await apiCoreRepo.postExecute(headers, url, body);
  }

  @override
  Future<Map<String, dynamic>> postJsonExecute(
      Map<String, String> headers, String url, Map<String, dynamic> body) async {
    return await apiCoreRepo.postJsonExecute(headers, url, body);
  }

  @override
  Future<Map<String, dynamic>> getCompressedExecute(Map<String, String> headers, String url) async {
    return await apiCoreRepo.getCompressExecute(headers, url);
  }

  @override
  Future<Map<String, dynamic>> postCompressedExecute(
      Map<String, String> headers, String url, Map<String, dynamic> body) async {
    return await apiCoreRepo.postCompressExecute(headers, url, body);
  }

  @override
  Future<Map<String, dynamic>> postJsonCompressedExecute(
      Map<String, String> headers, String url, Map<String, dynamic> body) async {
    return await apiCoreRepo.postJsonCompressExecute(headers, url, body);
  }
}
