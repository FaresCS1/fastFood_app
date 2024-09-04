import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/shered_widget/buttons/fill_buttons/widget/fill_button.dart';

Widget fillButtonNavigate(String text, String route) {
  return FillButton(
    text: text,
    icon: Icons.arrow_forward_ios_outlined,
    route: route,
  );
}
