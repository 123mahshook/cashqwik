abstract class ApiAppGeneralRepoContract{
      Future<Map<String, dynamic>> getProfileExecute(String url);
      Future<Map<String, dynamic>> postProfileExecute(String url, Map<String, dynamic> body);
      Future<Map<String, dynamic>> postProfileJsonExecute(String url, Map<String, dynamic> body);
      Future<Map<String, dynamic>> getProfileCompressedExecute(String url);
      Future<Map<String, dynamic>> postProfileCompressedExecute(String url, Map<String, dynamic> body);
      Future<Map<String, dynamic>> postProfileJsonCompressedExecute(String url, Map<String, dynamic> body);
      Map<String, dynamic> getGeneralHeaders();
  }