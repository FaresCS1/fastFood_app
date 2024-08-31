import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/models/current_user.dart';

import '../classes/shared_preferences/SharedPrefHelper.dart';
import '../colors/appColors.dart';
import '../constants/myRoutes.dart';
import '../shered_widget/dialog/customized_dialog.dart';

class UserProvider extends ChangeNotifier {
  GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> locationFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  List<QueryDocumentSnapshot> _currentUserData = [];
  CurrentUser? _currentUser;

  CurrentUser? get currentUser => _currentUser;

  // Future<void> checkUserState() async {
  //   await FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //
  //     } else {
  //
  //     }
  //   });
  // }

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

  void emptyController() {
    nameController.clear();
    passwordController.clear();
    emailController.clear();
    locationController.clear();
    phoneController.clear();
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    SharedPrefsHelper.setBool("login", false);
    notifyListeners();
    // checkUserState();
  }

  Future<void> login(BuildContext context) async {
    if (emailFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // checkUserState();
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

  Future<void> signUp(BuildContext context) async {
    if (nameFormKey.currentState!.validate() &&
        emailFormKey.currentState!.validate() &&
        phoneFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        addUserDetails(
          nameController.text.trim(),
          emailController.text.trim(),
          locationController.text.trim(),
          phoneController.text.trim(),
          passwordController.text.trim(),
        );
        // checkUserState();
        getData();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const SuccessDialog(
                  color: AppColors.greenColor,
                  icon: Icons.verified_user,
                  content: "success signUp Welcome To Fast Food App",
                  title: "Successfully SignUp",
                  textButton: "Explore The App",
                  route: homeRoute);
            });
        emptyController();
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

  Future<void> resetPassword(BuildContext context) async {
    if (emailFormKey.currentState!.validate()) {
      try {
        FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text);
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const SuccessDialog(
                  content: "Please Check your email to rest password",
                  title: "Check Email ",
                  textButton: '',
                  icon: Icons.mark_email_read,
                  route: homeRoute,
                  color: AppColors.lightOrangeColor);
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
