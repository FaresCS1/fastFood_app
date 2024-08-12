import 'package:flutter/material.dart';
import 'package:untitled2/core/models/app_info.dart';
import 'package:untitled2/features/cart/pages/cartScreen.dart';

class BottomBarProvider extends ChangeNotifier {
  int index = 0;
  bool asUser = true;

  void OnSelectedIconBar(int index, BuildContext context) {
    this.index = index;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Pages[index]));
    notifyListeners();
  }
}
