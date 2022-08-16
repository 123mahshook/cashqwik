import 'dart:convert';

import 'package:cashqwik/app/constants/web_config_contants.dart';
import 'package:cashqwik/app/contracts/base_service.dart';
import 'package:cookee_common/Services/convert_service.dart';
import 'package:http/http.dart' as http;

class GetHomeDataService extends BaseService {
  Future<List<dynamic>> get(String pageNumber) async {
    Map<String, dynamic> res = <String, dynamic>{};
    try {
      var response = await http.get(Uri.parse(fetchUserUrl + pageNumber));

      Map<String, dynamic> data = jsonDecode(response.body);
      _setData(data, pageNumber);
      return data['data'];
    } catch (_) {
      return [];
    }
  }

  _setData(Map<String, dynamic> res, String pageNumber) {
    try {
      if (ConvertService.convertString(res["page"]) ==
          ConvertService.convertString(res["total_pages"])) {
      } else if (ConvertService.convertString(res["page"]) == pageNumber) {
        appModel!.customerData = res['data'];
        appModel!.total = ConvertService.convertInt(res['total']);
      }
    } catch (_) {}
  }
}
/* if (ConvertService.convertString(res["page"]) ==
          ConvertService.convertString(res["total_pages"])) {
      } else */