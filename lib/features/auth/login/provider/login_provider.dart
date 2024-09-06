import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../../../core/colors/appColors.dart';
import '../../../../core/routes/myRoutes.dart';
import '../../../../core/shered_widget/dialog/build_dialog.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  final List<QueryDocumentSnapshot> _currentUserData = [];

  getData() async {
    try {
      QuerySnapshot userData = await FirebaseFirestore.instance
          .collection("Users")
          .where("email", isEqualTo: currentUserEmail)
          .get();
      _currentUserData.addAll(userData.docs);
      SharedPrefsHelper.setString("email", _currentUserData.first['email']);
      SharedPrefsHelper.setString(
          "fullName", _currentUserData.first['fullName']);
      SharedPrefsHelper.setString(
          "location", _currentUserData.first['location']);
      SharedPrefsHelper.setString(
          "password", _currentUserData.first['password']);
      SharedPrefsHelper.setString("phone", _currentUserData.first['phone']);
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
        getData();
        BuildDialog.showSuccessDialog(
            color: AppColors.greenColor,
            barrierDismissible: false,
            content: "success Login Welcome To Fast Food App",
            title: "Success Login",
            textButton: "Explore FastFood App",
            icon: Icons.verified_user,
            route: homeRoute);
      } on FirebaseAuthException catch (e) {
        BuildDialog.showErrorDialog(
          barrierDismissible: true,
          textButton:"Close",
          content: "filed login enter correct values",
          title: "Filed Login",
        );
      }
    }
  }
}
