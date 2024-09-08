import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/features/cart/cart_items.dart';

import '../../../features/orders/list_of_orders.dart';
import '../../shared_preferences/SharedPrefHelper.dart';
import '../../colors/appColors.dart';
import '../../routes/myRoutes.dart';
import '../../sheared_widget/dialog/build_dialog.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  void confirmSignOut() async {
    BuildDialog.showConfirmDialog(
        icon: Icons.exit_to_app,
        title: "SignOut",
        color: AppColors.redColor,
        barrierDismissible: true,
        content: "are you sure to sign out ?",
        route: loginRoute,
        fun: _signOut);
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    SharedPrefsHelper.setBool("login", false);
    myOrders.clear();
    myCart.clear();
    totalPill = 0;
    Future.microtask(() => notifyListeners());
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
          textButton: "Close",
          content: "filed reset enter correct values",
          title: "Filed Reset",
        );
      }
    }
  }
}
