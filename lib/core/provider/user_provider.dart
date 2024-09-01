import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../classes/shared_preferences/SharedPrefHelper.dart';
import '../colors/appColors.dart';
import '../constants/myRoutes.dart';
import '../shered_widget/dialog/customized_dialog.dart';

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
