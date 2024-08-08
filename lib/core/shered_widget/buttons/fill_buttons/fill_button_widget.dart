import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/shered_widget/buttons/fill_buttons/fill_button.dart';

Widget fillButton(dynamic route, String text, IconData icon) {
  return FillButton(
    text: text,
    icon: icon,
    route: route,
  );
}
