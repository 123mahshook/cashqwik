import 'package:cookee_common/Services/convert_service.dart';

class DbCartItemModel {
  int? id;
  String? storeId;
  String? itemId;
  int? quantity;
  String? variantId;
  String? addOns;
  String? addOnsQty;

  DbCartItemModel({
    this.id,
    this.storeId,
    this.itemId,
    this.quantity,
    this.variantId,
    this.addOns,
    this.addOnsQty,
  });

  factory DbCartItemModel.fromJson(Map<String, dynamic> json) =>
      DbCartItemModel(
          id: ConvertService.convertInt(json["id"]),
          storeId: ConvertService.convertString(json["storeId"]),
          itemId: ConvertService.convertString(json["itemId"]),
          quantity: ConvertService.convertInt(json["quantity"]),
          variantId: ConvertService.convertString(json["variantId"]),
          addOns: ConvertService.convertString(json["addOns"]),
          addOnsQty: ConvertService.convertString(json["addOnsQty"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "storeId": storeId,
        "itemId": itemId,
        "quantity": quantity,
        "variantId": variantId,
        "addOns": addOns,
        "addOnsQty": addOnsQty,
      };

  Map<String, dynamic> toJsonDb() => {
        "storeId": storeId,
        "itemId": itemId,
        "quantity": quantity,
        "variantId": variantId,
        "addOns": addOns,
        "addOnsQty": addOnsQty,
      };

  static List<DbCartItemModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<DbCartItemModel> pros =
            list.map((data) => DbCartItemModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static DbCartItemModel? parseItem(json) {
    if (json != null) {
      return DbCartItemModel.fromJson(json);
    }
    return null;
  }

  DbCartItemModel copyItem() => DbCartItemModel(
        id: id,
        storeId: storeId,
        itemId: itemId,
        quantity: quantity,
        variantId: variantId,
        addOns: addOns,
        addOnsQty: addOnsQty,
      );

  List<DbCartItemModel> copyItems(List<DbCartItemModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static DbCartItemModel initData() => DbCartItemModel(
        id: 0,
        storeId: "",
        itemId: "",
        quantity: 0,
        variantId: "",
        addOns: "",
        addOnsQty: "",
      );
}
