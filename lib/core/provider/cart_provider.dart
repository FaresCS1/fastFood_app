import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> MyCart = [];
  int totalBill = 0;

  void addToCart(dynamic item) {
    MyCart.add(item);
    _notifyListeners();
  }

  void moreItem(dynamic item) {
    item["numOfItem"] = item["numOfItem"] + 1;
    item["total price"] = item["total price"] + item["price"];
    _notifyListeners();
  }

  void lessItem(dynamic item) {
    if (item["numOfItem"] == 1) {
      removeFromCart(item);
      item["numOfItem"] = 1;
    } else {
      item["numOfItem"] = item["numOfItem"] - 1;
      item["total price"] = item["total price"] - item["price"];
    }
    _notifyListeners();
  }

  void removeFromCart(dynamic item) {
    MyCart.remove(item);
    _notifyListeners();
  }

  void TotalBill() {
    totalBill = 0;
    for (int i = 0; i < MyCart.length; i++) {
      totalBill += (MyCart[i]["total price"] as int);
    }
    _notifyListeners();
  }

  void ResetBill() {
    totalBill = 0;
    _notifyListeners();
  }

  void _notifyListeners() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
