import 'package:flutter/material.dart';
import '../../../core/colors/appColors.dart';
import '../../../core/routes/myRoutes.dart';
import '../../../core/shered_widget/dialog/success_dialog/success_dialog.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> myCart = [];
  List<dynamic> myOrder = [];
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

  List<dynamic> deepCopy(List<dynamic> list) {
    List<dynamic> copy = [];
    for (dynamic element in list) {
      if (element is List) {
        copy.add(deepCopy(element));
      } else {
        copy.add(element); // Copy other elements directly
      }
    }
    return copy;
  }

  Future<void> sendOrder(BuildContext context) async {
    myCart.add({"totalPrice": _totalPill});
    List<dynamic> copyCart = deepCopy(myCart);
    myOrder.add(copyCart);
    print("MY Orders");
    print(myOrder);
    print("MY Cart");
    print(myCart);
    resetBill();
    emptyCart();
    print("After MY Orders");
    print(myOrder);
    print("After MY Cart");
    print(myCart);
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
