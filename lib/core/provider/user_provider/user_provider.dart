import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared_preferences/SharedPrefHelper.dart';
import '../../colors/appColors.dart';
import '../../routes/myRoutes.dart';
import '../../shered_widget/dialog/error_dialog/error_dialog.dart';
import '../../shered_widget/dialog/success_dialog/success_dialog.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    SharedPrefsHelper.setBool("login", false);
    notifyListeners();
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
                  route: loginRoute,
                  color: AppColors.lightOrangeColor);
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
}
