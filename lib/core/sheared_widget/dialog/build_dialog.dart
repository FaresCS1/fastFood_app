import 'package:flutter/material.dart';
import 'package:untitled2/core/sheared_widget/dialog/success_dialog/success_dialog.dart';

import 'confirm_dialog/confirm_dialog.dart';
import 'error_dialog/error_dialog.dart';

class BuildDialog {
  static BuildContext? _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static Future<void> showSuccessDialog(
      {required bool barrierDismissible,
      required String content,
      required String title,
      required dynamic route,
      required IconData icon,
      required String textButton,
      required Color color}) async {
    await showDialog(
        context: _context!,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return SuccessDialog(
              content: content,
              title: title,
              textButton: textButton,
              icon: icon,
              route: route,
              color: color);
        });
  }

  static Future<void> showErrorDialog(
      {required bool barrierDismissible,
      required String content,
      required String title,
      dynamic route,
      required String textButton,
      IconData? icon,
      Color? color}) async {
    await showDialog(
        context: _context!,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return ErrorDialog(
            content: content,
            title: title,
            textButton: textButton,
            icon: icon,
            route: route,
            color: color,
          );
        });
  }

  static Future<void> showConfirmDialog({
    required bool barrierDismissible,
    required String content,
    required String title,
    required dynamic route,
    required IconData icon,
    required Color color,
    required VoidCallback fun,
  }) async {
    await showDialog(
        context: _context!,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return ConfirmDialog(
              content: content,
              title: title,
              textButton: 'Ok',
              icon: icon,
              route: route,
              color: color,
              fun: () => fun());
        });
  }
}
