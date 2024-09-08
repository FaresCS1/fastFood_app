import 'package:flutter/material.dart';
import 'package:untitled2/features/cart/cart_items.dart';
import 'package:untitled2/features/orders/list_of_orders.dart';
import '../../../core/colors/appColors.dart';
import '../../../core/routes/myRoutes.dart';
import '../../../core/sheared_widget/dialog/build_dialog.dart';

class CartProvider extends ChangeNotifier {
  int _totalItemPrice = 0;
  dynamic _currentItemUpdate;
  bool credit = true;

  void addToCart(dynamic item) {
    myCart.add(item);
    _totalItemPrice = item["price"] * item["numOfItem"];
    totalPill = totalPill + _totalItemPrice;
    Future.microtask(() => notifyListeners());
  }

  void moreItem(dynamic item) {
    _currentItemUpdate = myCart.where((item_) => item_ == item);
    if (_currentItemUpdate.isNotEmpty) {
      _totalItemPrice = item["price"] * item["numOfItem"];
      totalPill = totalPill - _totalItemPrice;
      item["numOfItem"] = item["numOfItem"] + 1;
      _totalItemPrice = item["price"] * item["numOfItem"];
      item["total price"] = _totalItemPrice;
      totalPill = totalPill + _totalItemPrice;
    } else {
      item["numOfItem"] = item["numOfItem"] + 1;
      item["total price"] = item["total price"] + item["price"];
    }
    Future.microtask(() => notifyListeners());
  }

  void lessItem(dynamic item) {
    _currentItemUpdate = myCart.where((item_) => item_ == item);
    if (_currentItemUpdate.isNotEmpty) {
      if (item["numOfItem"] == 1) {
        item["numOfItem"] = 1;
        item["total price"] = item["price"];
      } else {
        totalPill = totalPill - item["price"] as int;
        item["numOfItem"] = item["numOfItem"] - 1;
        item["total price"] = item["total price"] - item["price"];
      }
    } else {
      if (item["numOfItem"] > 1) {
        item["numOfItem"] = item["numOfItem"] - 1;
        item["total price"] = item["total price"] - item["price"];
      }
    }
    Future.microtask(() => notifyListeners());
  }

  void removeFromCart(dynamic item) {
    _totalItemPrice = item["price"] * item["numOfItem"];
    totalPill = totalPill - _totalItemPrice;
    item["numOfItem"] = 1;
    item["total price"] = item["price"];
    myCart.remove(item);
    Future.microtask(() => notifyListeners());
    if (myCart.isEmpty) {
      BuildDialog.showSuccessDialog(
          barrierDismissible: false,
          content: "no item in the cart go to menu and shopping again",
          title: "Empty Cart",
          route: menuRoute,
          icon: Icons.shopping_cart_outlined,
          textButton: "Menu Screen",
          color: AppColors.lightOrangeColor);
    }
  }

  void resetBill() {
    totalPill = 0;
  }

  List<dynamic> deepCopy(List<dynamic> list) {
    List<dynamic> copy = [];
    for (dynamic element in list) {
      if (element is List) {
        copy.add(deepCopy(element));
      } else {
        copy.add(element);
      }
    }
    return copy;
  }

  Future<void> sendOrder() async {
    myCart.add({"totalPrice": totalPill});
    List<dynamic> copyCart = deepCopy(myCart);
    myOrders.add(copyCart);
    BuildDialog.showSuccessDialog(
        icon: Icons.fastfood,
        title: "Successfully Send Order",
        textButton: "Home",
        color: AppColors.orangeColor,
        barrierDismissible: false,
        content: "success order Welcome To Fast Food App",
        route: homeRoute);
    resetBill();
    emptyCart();
  }

  void emptyCart() {
    myCart.clear();
    resetBill();
    Future.microtask(() => notifyListeners());
  }

  void paymentWay() {
    credit = !credit;
    Future.microtask(() => notifyListeners());
  }
}
