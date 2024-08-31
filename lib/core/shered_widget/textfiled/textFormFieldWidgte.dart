import 'package:flutter/cupertino.dart';
import 'package:untitled2/core/shered_widget/textfiled/textFormFiled.dart';

Widget textFieldWidget(IconData icon, String hintText, bool obscureText,
    TextEditingController controller, GlobalKey<FormState> formKey) {
  return CustomTextField(
    controller: controller,
    icon: icon,
    formKey: formKey,
    hintText: hintText,
  );
}
