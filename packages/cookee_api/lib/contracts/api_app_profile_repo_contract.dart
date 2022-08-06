abstract class ApiAppProfileRepoContract{
      Future<Map<String, dynamic>> getProfileExecute(String url,Map<String, String> headers);
      Future<Map<String, dynamic>> postProfileExecute(String url, Map<String, dynamic> body,Map<String, String> headers);
      Future<Map<String, dynamic>> postProfileJsonExecute(String url, Map<String, dynamic> body,Map<String, String> headers);
      Future<Map<String, dynamic>> getProfileCompressedExecute(String url,Map<String, String> headers);
      Future<Map<String, dynamic>> postProfileCompressedExecute(String url, Map<String, dynamic> body,Map<String, String> headers);
      Future<Map<String, dynamic>> postProfileJsonCompressedExecute(String url, Map<String, dynamic> body,Map<String, String> headers);
      Map<String, dynamic> getGeneralHeaders();
  }