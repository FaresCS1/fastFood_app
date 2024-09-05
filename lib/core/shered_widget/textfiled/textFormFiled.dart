import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import '../../colors/appColors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final GlobalKey<FormState> formKey;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.formKey,
      required this.hintText});

  String? validatorValue(String type, TextEditingController controller) {
    if (type == "phone") {
      if (int.tryParse(controller.text) != null) {
        if (controller.text.startsWith("5") == false) {
          return "Phone number must start with 5 ";
        } else {
          if (controller.text.length < 10) {
            return "Phone number must be at least 10 digits.";
          } else {
            return null;
          }
        }
      } else if (controller.text.isEmpty) {
        return "Please enter a phone number.";
      } else if (controller.text.isNotEmpty &&
          int.tryParse(controller.text) == null) {
        return "Phone number must contain only digits.";
      } else {
        null;
      }
    } else if (type == "email") {
      if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
          .hasMatch(controller.text)) {
        return null;
      }
      return "Please enter a valid email address!";
    } else if (type == "full name") {
      if (RegExp(r'^[a-zA-Z\s]+$').hasMatch(controller.text)) {
        return null;
      }
      return "name must contain only letters.";
    } else if (type == "password") {
      if (controller.text.isNotEmpty) {
        if (controller.text.length < 6) {
          return "Password must be at least 6 letters.";
        } else {
          return null;
        }
      } else if (controller.text.isEmpty) {
        return "Please enter a Password";
      } else {
        null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: dimensionHeight(0.10),
        child: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => validatorValue(hintText, controller),
            maxLength: hintText == "phone" ? 10 : null,
            keyboardType:
                hintText == "phone" ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: AppColors.midOrangeColor,
                size: 28,
              ),
              suffixIcon: hintText == "phone"
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(
                        "assets/images/others/saudi_flag.png",
                        height: 10,
                      ),
                    )
                  : null,
              errorStyle: const TextStyle(
                  color: AppColors.yellowWarningColor,
                  fontWeight: FontWeight.bold),
              hintText: hintText,
              prefixText: hintText == "phone" ? "+966 " : null,
              prefixStyle: const TextStyle(
                color: AppColors.orangeColor,
              ),
              fillColor: AppColors.beigeColor,
              filled: true,
              hintStyle: const TextStyle(color: AppColors.grayColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ));
  }
}
