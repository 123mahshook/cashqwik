import 'package:cookee_common/Services/convert_service.dart';
import 'package:cashqwik/app/models/db_models/db_cart_item_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<DbCartItemModel> cartItems = <DbCartItemModel>[];

  setCartItem(List<DbCartItemModel> cart) {
    cartItems = cart;
    notifyListeners();
  }

  String getCurrentItemsInCart() {
    return ConvertService.convertString(cartItems.length);
  }

  setCartItemClear() {
    cartItems.clear();
    notifyListeners();
  }
}
