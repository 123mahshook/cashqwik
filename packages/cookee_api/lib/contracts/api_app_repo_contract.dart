abstract class ApiAppRepoContract{
      Future<Map<String, dynamic>> getExecute(Map<String, String> headers, String url);
      Future<Map<String, dynamic>> postExecute(Map<String, String> headers,String url, Map<String, dynamic> body);
      Future<Map<String, dynamic>> postJsonExecute(Map<String, String> headers,String url, Map<String, dynamic> body);
      Future<Map<String, dynamic>> getCompressedExecute(Map<String, String> headers, String url);
      Future<Map<String, dynamic>> postCompressedExecute(Map<String, String> headers,String url, Map<String, dynamic> body);
      Future<Map<String, dynamic>> postJsonCompressedExecute(Map<String, String> headers,String url, Map<String, dynamic> body);
  }