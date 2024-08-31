import 'package:flutter/material.dart';

import '../constants/myRoutes.dart';

class BottomBarProvider extends ChangeNotifier {
  int Index = 0;
  List<dynamic> Pages = [homeRoute, offersRoute, menuRoute, moreRoute];

  void updateIndex(int index, BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Pages[index], arguments: "All", (route) {
      return route.isFirst || route.settings.name == homeRoute;
    });
  }
}
