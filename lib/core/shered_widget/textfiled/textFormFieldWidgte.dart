import 'package:flutter/cupertino.dart';
import 'package:untitled2/core/shered_widget/textfiled/textFormFiled.dart';

Widget TextFieldWidget(IconData icon, String hinttext, bool obscureText,
    TextEditingController controller) {
  return TextField(icon, hinttext, obscureText, controller);
}
