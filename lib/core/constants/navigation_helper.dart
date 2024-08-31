import 'package:flutter/cupertino.dart';

class NavigationHelper {
  static void navigateAndReplace(BuildContext context, String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
  }
}
