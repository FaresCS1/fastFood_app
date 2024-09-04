import 'package:flutter/material.dart';
import 'package:untitled2/features/orders/data/myOrders.dart';

import '../../../routes/myRoutes.dart';

class BottomBarProvider extends ChangeNotifier {
  int Index = 0;
  List<dynamic> Pages = [homeRoute, ordersRoute, menuRoute, moreRoute];

  void updateIndex(int index, BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Pages[index], arguments: "All", (route) {
      return route.isFirst || route.settings.name == homeRoute;
    });
  }
}
