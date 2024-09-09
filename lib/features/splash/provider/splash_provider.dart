import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool shouldNavigate = false;

  Future<void> startDelayedNavigation() {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        shouldNavigate = true;
        Future.microtask(() => notifyListeners());
      },
    );
  }
}
