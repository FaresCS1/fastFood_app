import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../AuthButton.dart';

Widget authButton(String text, IconData icon, VoidCallback fun) {
  return AuthButton(
    text: text,
    icon: icon,
    function: fun,
  );
}
