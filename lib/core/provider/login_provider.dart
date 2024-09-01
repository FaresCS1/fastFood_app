import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../classes/shared_preferences/SharedPrefHelper.dart';
import '../colors/appColors.dart';
import '../constants/myRoutes.dart';
import '../models/current_user.dart';
import '../shered_widget/dialog/customized_dialog.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  List<QueryDocumentSnapshot> _currentUserData = [];
  CurrentUser? _currentUser;

  CurrentUser? get currentUser => _currentUser;

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
      print(e.toString());
    }
  }

  Future<void> login(BuildContext context) async {
    if (emailFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        getData();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const SuccessDialog(
                  color: AppColors.greenColor,
                  icon: Icons.verified_user,
                  content: "success Login Welcome To Fast Food App",
                  title: "Success Login",
                  textButton: "Explore The App",
                  route: homeRoute);
            });
      } on FirebaseAuthException catch (e) {
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
}
