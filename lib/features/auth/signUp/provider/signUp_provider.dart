import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors/appColors.dart';
import '../../../../core/routes/myRoutes.dart';
import '../../../../core/shered_widget/dialog/error_dialog/error_dialog.dart';
import '../../../../core/shered_widget/dialog/success_dialog/success_dialog.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  List<String> cities = [
    "Riyadh",
    "Jeddah",
    "Mecca",
    "Medina",
    "Dammam",
    "Abha",
    "Al-Qassim",
  ];
  String? selectedCity;

  void setCity(String? value) {
    selectedCity = value;
  }

  Future<void> signUp(BuildContext context) async {
    if (nameFormKey.currentState!.validate() &&
        emailFormKey.currentState!.validate() &&
        phoneFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate() &&
        selectedCity != null) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        addUserDetails(
          nameController.text.trim(),
          emailController.text.trim(),
          selectedCity!,
          phoneController.text.trim(),
          passwordController.text.trim(),
        );
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const SuccessDialog(
                  color: AppColors.greenColor,
                  icon: Icons.verified_user,
                  content: "success New account Welcome To Fast Food App",
                  title: "Successfully SignUp",
                  textButton: "Login with the new account",
                  route: loginRoute);
            });
      } on FirebaseAuthException catch () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const ErrorDialog(
                  content: "filed login enter correct values",
                  title: "Filed Login");
            });
      }
    }
  }

  Future addUserDetails(String fullName, String email, dynamic location,
      String phone, String password) async {
    await FirebaseFirestore.instance.collection("Users").add({
      "fullName": fullName,
      "email": email,
      "location": location,
      "phone": phone,
      "password": password
    });
  }
}
