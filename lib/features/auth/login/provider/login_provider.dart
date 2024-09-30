import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../../../core/colors/appColors.dart';
import '../../../../core/routes/myRoutes.dart';
import '../../../../core/sheared_widget/dialog/build_dialog.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  final List<QueryDocumentSnapshot> currentUserData = [];

  getData() async {
    print("4444444444444444444444444444444");
    try {
      print("5555555555555555555555555555555555555555555555");
      QuerySnapshot userData = await FirebaseFirestore.instance
          .collection("Users")
          .where("email", isEqualTo: emailController.text)
          .get();
      currentUserData.addAll(userData.docs);
      SharedPrefsHelper.setString("email", currentUserData.first['email']);
      SharedPrefsHelper.setString(
          "fullName", currentUserData.first['fullName']);
      SharedPrefsHelper.setString(
          "location", currentUserData.first['location']);
      SharedPrefsHelper.setString(
          "password", currentUserData.first['password']);
      SharedPrefsHelper.setString("phone", currentUserData.first['phone']);
      SharedPrefsHelper.setBool("login", true);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> login() async {
    if (emailFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          getData();
          BuildDialog.showSuccessDialog(
              color: AppColors.greenColor,
              barrierDismissible: false,
              content: "success Login Welcome To Fast Food App",
              title: "Success Login",
              textButton: "Explore FastFood App",
              icon: Icons.verified_user,
              route: homeRoute);
        } else if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
          FirebaseAuth.instance.currentUser!.sendEmailVerification();
          BuildDialog.showErrorDialog(
            barrierDismissible: true,
            textButton: "Close",
            content: "filed login authenticate your email",
            title: "Filed Login",
          );
        }
      } on FirebaseAuthException catch (e) {
        BuildDialog.showErrorDialog(
          barrierDismissible: true,
          textButton: "Close",
          content: "filed login enter correct values",
          title: "Filed Login",
        );
      }
    }
  }
}
