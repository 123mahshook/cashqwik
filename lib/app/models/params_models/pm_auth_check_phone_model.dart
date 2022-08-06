import 'package:cookee_common/Services/convert_service.dart';

class PmAuthCheckPhoneModel {
  String? phoneNumber;
  String? tempId;

  PmAuthCheckPhoneModel({
    this.phoneNumber,
    this.tempId,
  });

  factory PmAuthCheckPhoneModel.fromJson(Map<String, dynamic> json) =>
      PmAuthCheckPhoneModel(
        phoneNumber: ConvertService.convertString(json["phoneNumber"]),
        tempId: ConvertService.convertString(json["tempId"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "tempId": tempId,
      };

  static List<PmAuthCheckPhoneModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmAuthCheckPhoneModel> pros =
            list.map((data) => PmAuthCheckPhoneModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmAuthCheckPhoneModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmAuthCheckPhoneModel.fromJson(json);
    }
    return null;
  }

  PmAuthCheckPhoneModel copyItem() => PmAuthCheckPhoneModel(
        phoneNumber: phoneNumber,
        tempId: tempId,
      );

  List<PmAuthCheckPhoneModel> copyItems(List<PmAuthCheckPhoneModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmAuthCheckPhoneModel initData() => PmAuthCheckPhoneModel(
        phoneNumber: "",
        tempId: "",
      );
}
