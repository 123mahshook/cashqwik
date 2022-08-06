import 'package:cookee_common/Services/convert_service.dart';

class PmAuthVerifyOTPModel {
  String? userId;
  String? otp;
  String? firebaseToken;
  String? referralCode;

  PmAuthVerifyOTPModel({
    this.userId,
    this.otp,
    this.firebaseToken,
    this.referralCode,
  });

  factory PmAuthVerifyOTPModel.fromJson(Map<String, dynamic> json) =>
      PmAuthVerifyOTPModel(
        userId: ConvertService.convertString(json["userId"]),
        otp: ConvertService.convertString(json["otp"]),
        firebaseToken: ConvertService.convertString(json["firebase_tokken"]),
        referralCode: ConvertService.convertString(json["referralCode"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "otp": otp,
        "firebase_tokken": firebaseToken,
        "referralCode": referralCode,
      };

  static List<PmAuthVerifyOTPModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmAuthVerifyOTPModel> pros =
            list.map((data) => PmAuthVerifyOTPModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmAuthVerifyOTPModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmAuthVerifyOTPModel.fromJson(json);
    }
    return null;
  }

  PmAuthVerifyOTPModel copyItem() => PmAuthVerifyOTPModel(
        userId: userId,
        otp: otp,
        firebaseToken: firebaseToken,
        referralCode: referralCode,
      );

  List<PmAuthVerifyOTPModel> copyItems(List<PmAuthVerifyOTPModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmAuthVerifyOTPModel initData() => PmAuthVerifyOTPModel(
        userId: "",
        otp: "",
        firebaseToken: "",
        referralCode: "",
      );
}
