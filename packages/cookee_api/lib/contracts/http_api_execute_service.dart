import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cookee_api/constants/messages.dart';
import 'package:cookee_api/enums/app_api_type_enum.dart';
import 'package:http/http.dart' as http;

abstract class HttpApiExecuteService {
  final int _timeOutSeconds = 480;
  final String _lookupAddress = 'google.com';
  final Map<String, dynamic> _timeOutErrorBody = {
    "status": false,
    "message": MS_SERVER_ERROR
  };
  final Map<String, dynamic> _serverErrorBody = {
    "status": false,
    "message": MS_SERVER_ERROR
  };
  final Map<String, dynamic> _socketErrorBody = {
    "status": false,
    "message": MS_SERVER_ERROR
  };
  final Map<String, dynamic> _commonErrorBody = {
    "status": false,
    "message": MS_SOMETHING_WENT_WRONG
  };
  final Map<String, dynamic> _noInternetErrorBody = {
    "status": false,
    "message": MS_NO_INTERNET_CONNECTION
  };
  final Map<String, String> _jsonPostHeader = {
    "Content-Type": "application/json"
  };

  Future<Map<String, dynamic>> executeRequestApi(Map<String, String> headers,
      String url, Map<String, dynamic> body, AppApiType requestType) async {
    print(headers);
    print(body);
    print(url);
    bool connection = await apiCheckInternetConnection();
    if (!connection) {
      return _noInternetErrorBody;
    }
    Map<String, dynamic> result = {};
    try {
      try {
        http.Response response;
        bool compressData = false;
        switch (requestType) {
          case AppApiType.get:
            {
              response = await _httpGetRequestExecute(headers, url);
              print("------------------------");
              print(response.body);
              print("------------------------");
            }
            break;
          case AppApiType.post:
            {
              response = await _httpPostRequestExecute(headers, url, body);
              print("------------------------");
              print(response.body);
              print("------------------------");
            }
            break;
          case AppApiType.postJson:
            {
              response = await _httpPostRequestJsonExecute(headers, url, body);
              print("------------------------");
              print(response.body);
              print("------------------------");
            }
            break;
          case AppApiType.getCompress:
            {
              compressData = true;
              response = await _httpGetRequestExecute(headers, url);
            }
            break;
          case AppApiType.postCompress:
            {
              compressData = true;
              response = await _httpPostRequestExecute(headers, url, body);
            }
            break;
          case AppApiType.postJsonCompress:
            {
              compressData = true;
              response = await _httpPostRequestJsonExecute(headers, url, body);
            }
            break;
        }
        if (compressData) {
          result = _processResponseBodyCompressed(response);
        } else {
          result = _processResponseBody(response);
        }
      } on TimeoutException catch (_) {
        result = _timeOutErrorBody;
      } on SocketException catch (_) {
        result = _socketErrorBody;
      }
    } catch (e) {
      result = _commonErrorBody;
    }
    return result;
  }

  Map<String, dynamic> _processResponseBody(http.Response? response) {
    Map<String, dynamic> result = {};
    try {
      if (response != null) {
        if (response.statusCode == 200) {
          result = json.decode(response.body);
        } else {
          result = _serverErrorBody;
        }
      } else {
        result = _serverErrorBody;
      }
    } catch (e) {
      result = _serverErrorBody;
    }
    return result;
  }

  Map<String, dynamic> _processResponseBodyCompressed(http.Response? response) {
    Map<String, dynamic> result = {};
    try {
      if (response != null) {
        if (response.statusCode == 200) {
          var bytes = response.bodyBytes;
          var inflated = zlib.decode(bytes);
          var data = utf8.decode(inflated);
          result = json.decode(data);
        } else {
          result = _serverErrorBody;
        }
      } else {
        result = _serverErrorBody;
      }
    } catch (e) {
      result = _serverErrorBody;
    }
    return result;
  }

  Future<bool> apiCheckInternetConnection() async {
    bool res = false;
    try {
      final result = await InternetAddress.lookup(_lookupAddress);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        res = true;
      }
    } on SocketException catch (_) {}
    return res;
  }

  Future<http.Response> _httpGetRequestExecute(
      Map<String, String> headers, String url) async {
    Uri httpUrl = Uri.parse(url);
    return await http
        .get(httpUrl, headers: headers)
        .timeout(Duration(seconds: _timeOutSeconds));
  }

  Future<http.Response> _httpPostRequestExecute(Map<String, String> headers,
      String url, Map<String, dynamic> body) async {
    Uri httpUrl = Uri.parse(url);
    return await http
        .post(httpUrl, headers: headers, body: body)
        .timeout(Duration(seconds: _timeOutSeconds));
  }

  Future<http.Response> _httpPostRequestJsonExecute(Map<String, String> headers,
      String url, Map<String, dynamic> body) async {
    Uri httpUrl = Uri.parse(url);
    headers.addAll(_jsonPostHeader);
    return await http
        .post(httpUrl, headers: headers, body: json.encode(body))
        .timeout(Duration(seconds: _timeOutSeconds));
  }
}
