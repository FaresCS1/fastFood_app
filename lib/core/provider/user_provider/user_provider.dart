import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared_preferences/SharedPrefHelper.dart';
import '../../colors/appColors.dart';
import '../../routes/myRoutes.dart';
import '../../shered_widget/dialog/build_dialog.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    SharedPrefsHelper.setBool("login", false);
    notifyListeners();
  }

  Future<void> resetPassword() async {
    if (emailFormKey.currentState!.validate()) {
      try {
        FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text);
        BuildDialog.showSuccessDialog(
            color: AppColors.lightOrangeColor,
            barrierDismissible: false,
            content: "Please Check your email to rest password",
            title: "Check Email",
            textButton: "Login",
            icon: Icons.email,
            route: loginRoute);
      } on FirebaseAuthException catch (e) {
        BuildDialog.showErrorDialog(
          barrierDismissible: true,
          textButton:"Close",
          content: "filed reset enter correct values",
          title: "Filed Reset",
        );
      }
    }
  }
}
