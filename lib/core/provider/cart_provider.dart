import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../colors/appColors.dart';
import '../constants/myRoutes.dart';
import '../shered_widget/dialog/customized_dialog.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> myCart = [];
  int _totalPill = 0;
  int get totalPill => _totalPill;
  int _totalItemPrice = 0;
  dynamic _currentItemUpdate;
  bool credit = true;

  void addToCart(dynamic item) {
    myCart.add(item);
    _totalItemPrice = item["price"] * item["numOfItem"];
    _totalPill = _totalPill + _totalItemPrice;
    Future.microtask(() => notifyListeners());
  }

  void moreItem(dynamic item) {
    _currentItemUpdate = myCart.where((item_) => item_ == item);
    if (_currentItemUpdate.isNotEmpty) {
      _totalItemPrice = item["price"] * item["numOfItem"];
      _totalPill = _totalPill - _totalItemPrice;
      item["numOfItem"] = item["numOfItem"] + 1;
      _totalItemPrice = item["price"] * item["numOfItem"];
      item["total price"] = _totalItemPrice;
      _totalPill = _totalPill + _totalItemPrice;
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
        _totalPill = _totalPill - item["price"] as int;
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
    _totalPill = _totalPill - _totalItemPrice;
    item["numOfItem"] = 1;
    item["total price"] = item["price"];
    myCart.remove(item);
    Future.microtask(() => notifyListeners());
  }

  void resetBill() {
    _totalPill = 0;
  }

  Future<void> sendOrder(BuildContext context) async {
    resetBill();
    emptyCart();
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const SuccessDialog(
              color: AppColors.orangeColor,
              icon: Icons.fastfood,
              content: "success order Welcome To Fast Food App",
              title: "Successfully Send Order",
              textButton: "Home",
              route: homeRoute);
        });
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
