import 'package:cookee_common/Services/convert_service.dart';

class ApiAuthCheckPhoneModel {
  bool? status;
  String? message;
  String? userId;
  String? otp;
  bool? register;

  ApiAuthCheckPhoneModel({
    this.status,
    this.message,
    this.userId,
    this.otp,
    this.register,
  });

  factory ApiAuthCheckPhoneModel.fromJson(Map<String, dynamic> json) =>
      ApiAuthCheckPhoneModel(
        status: ConvertService.convertBool(json["status"]),
        message: ConvertService.convertString(json["message"]),
        userId: ConvertService.convertString(json["user_id"]),
        otp: ConvertService.convertString(json["otp"]),
        register: ConvertService.convertBool(json["register"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user_id": userId,
        "otp": otp,
        "register": register,
      };

  static List<ApiAuthCheckPhoneModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiAuthCheckPhoneModel> pros =
            list.map((data) => ApiAuthCheckPhoneModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiAuthCheckPhoneModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiAuthCheckPhoneModel.fromJson(json);
    }
    return null;
  }

  ApiAuthCheckPhoneModel copyItem() => ApiAuthCheckPhoneModel(
        status: status,
        message: message,
        userId: userId,
        otp: otp,
        register: register,
      );

  List<ApiAuthCheckPhoneModel> copyItems(List<ApiAuthCheckPhoneModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiAuthCheckPhoneModel initData() => ApiAuthCheckPhoneModel(
      status: false, message: "", userId: "", otp: "", register: false);
}
