import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AuthButton.dart';

Widget authButtonWidget(String text, IconData icon, VoidCallback fun) {
  return AuthButton(
    text: text,
    icon: icon,
    function: fun,
  );
}
