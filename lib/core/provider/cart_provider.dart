import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> MyCart = [];
  int totalBill = 0;

  void addToCart(dynamic item) {
    MyCart.add(item);
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

  void removeFromCart(dynamic index) {
    MyCart.remove(index);
    notifyListeners();
  }

  void TotalBill() {
    for (int i = 0; i < MyCart.length; i++) {
      totalBill += (MyCart[i]["total price"] as int);
    }
    notifyListeners();
  }

  void ResetBill() {
    totalBill = 0;
    notifyListeners();
  }
}
