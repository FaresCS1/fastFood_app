import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors/appColors.dart';
import '../../../../core/routes/myRoutes.dart';
import '../../../../core/sheared_widget/dialog/build_dialog.dart';

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

  Future<void> signUp() async {
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
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        BuildDialog.showSuccessDialog(
            color: AppColors.greenColor,
            barrierDismissible: false,
            textButton: "Login with the new account",
            content: "success New account Welcome To Fast Food App",
            title: "Successfully SignUp",
            icon: Icons.verified_user,
            route: loginRoute);
      } on FirebaseAuthException catch (e) {
        BuildDialog.showErrorDialog(
          barrierDismissible: true,
          textButton: "Close",
          content: "filed SignUp enter correct values",
          title: "Filed SignUp",
        );
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
