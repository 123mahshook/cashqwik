import 'package:cookee_common/Services/convert_service.dart';

class FireBaseLocationModel {
  String? id;
  String? name;
  String? locationLat;
  String? locationLong;

  FireBaseLocationModel({
    this.id,
    this.name,
    this.locationLat,
    this.locationLong,
  });

  factory FireBaseLocationModel.fromJson(Map<String, dynamic> json) =>
      FireBaseLocationModel(
        id: ConvertService.convertString(json["id"]),
        name: ConvertService.convertString(json["name"]),
        locationLat: ConvertService.convertString(json["locationLat"]),
        locationLong: ConvertService.convertString(json["locationLong"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "locationLat": locationLat,
        "locationLong": locationLong,
      };

  static List<FireBaseLocationModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<FireBaseLocationModel> pros =
            list.map((data) => FireBaseLocationModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static FireBaseLocationModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return FireBaseLocationModel.fromJson(json);
    }
    return null;
  }

  FireBaseLocationModel copyItem() => FireBaseLocationModel(
        id: id,
        name: name,
        locationLat: locationLat,
        locationLong: locationLong,
      );

  List<FireBaseLocationModel> copyItems(List<FireBaseLocationModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static FireBaseLocationModel initData() => FireBaseLocationModel(
        id: "",
        name: "",
        locationLat: "",
        locationLong: "",
      );
}
