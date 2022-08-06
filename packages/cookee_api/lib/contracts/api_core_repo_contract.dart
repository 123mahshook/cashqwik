abstract class ApiCoreRepoContract{
      Future<Map<String, dynamic>> getExecute(Map<String, String> headers, String url);
      Future<Map<String, dynamic>> postExecute(Map<String, String> headers,String url, Map<String, dynamic> body);
      Future<Map<String, dynamic>> postJsonExecute(Map<String, String> headers,String url, Map<String, dynamic> body);
      Future<Map<String, dynamic>> getCompressExecute(Map<String, String> headers, String url);
      Future<Map<String, dynamic>> postCompressExecute(Map<String, String> headers,String url, Map<String, dynamic> body);
      Future<Map<String, dynamic>> postJsonCompressExecute(Map<String, String> headers,String url, Map<String, dynamic> body);
      Future<bool> apiCheckInternetConnectionMeta();
  }