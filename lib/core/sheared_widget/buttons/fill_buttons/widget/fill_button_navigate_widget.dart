import 'package:flutter/material.dart';

import 'fill_button.dart';

Widget fillButtonNavigate(String text, String route) {
  return FillButton(
    text: text,
    icon: Icons.arrow_forward_ios_outlined,
    route: route,
  );
}
