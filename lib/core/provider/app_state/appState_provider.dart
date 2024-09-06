import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class AppStateProvider extends ChangeNotifier {
  bool? isConnected;
  late StreamSubscription<List<ConnectivityResult>> subscription;

  void checkConnectivity() async {
    dynamic connectivityResult = await Connectivity().checkConnectivity();
    updateConnectivity(connectivityResult);
  }

  Future<void> updateConnectivity(List<ConnectivityResult> results) async {
    isConnected = results.any((result) => result != ConnectivityResult.none);
    notifyListeners();
  }

  void trackInternetConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen((results) {
      updateConnectivity(results);
    });
  }

  void disposeTrack() {
    subscription.cancel();
  }
}
