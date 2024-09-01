import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../colors/appColors.dart';
import '../constants/myRoutes.dart';
import '../shered_widget/dialog/customized_dialog.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> locationFormKey = GlobalKey<FormState>();

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
}
