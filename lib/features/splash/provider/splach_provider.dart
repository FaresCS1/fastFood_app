import 'package:flutter/material.dart';

class SplachProvider extends ChangeNotifier {
  bool shouldNavigate = false;

  Future<void> startDelayedNavigation() {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        shouldNavigate = true;
        notifyListeners();
      },
    );
  }
}
