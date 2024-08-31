import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../colors/appColors.dart';
import '../constants/myRoutes.dart';
import '../shered_widget/dialog/customized_dialog.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> myCart = [];
  int totalBill = 0;
  bool credit = true;

  void addToCart(dynamic item) {
    myCart.add(item);
    notifyListeners();
  }

  void moreItem(dynamic item) {
    item["numOfItem"] = item["numOfItem"] + 1;
    item["total price"] = item["total price"] + item["price"];
    notifyListeners();
  }

  void lessItem(dynamic item) {
    if (item["numOfItem"] == 1) {
      removeFromCart(item);
      item["numOfItem"] = 1;
    } else {
      item["numOfItem"] = item["numOfItem"] - 1;
      item["total price"] = item["total price"] - item["price"];
    }
    notifyListeners();
  }

  void removeFromCart(dynamic item) {
    myCart.remove(item);
    getTotalBill();
    notifyListeners();
  }

  int getTotalBill() {
    resetBill();
    for (int i = 0; i < myCart.length; i++) {
      totalBill += (myCart[i]["total price"] as int);
    }
    notifyListeners();
    return totalBill;
  }

  void resetBill() {
    notifyListeners();
    totalBill = 0;
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
    getTotalBill();
    notifyListeners();
  }

  void paymentWay() {
    credit = !credit;
    notifyListeners();
  }
}
