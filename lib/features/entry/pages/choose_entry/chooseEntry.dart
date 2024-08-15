import 'package:flutter/material.dart';

import '../../../../core/shered_widget/buttons/fill_buttons/fill_button_widget.dart';
import '../../../../core/shered_widget/logo/logo.dart';
import '../../../home/pages/home_screen.dart';
import '../login/login_screen.dart';
import '../signup/signUp.dart';

class ChooseEntry extends StatelessWidget {
  const ChooseEntry({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appLogo(currentWidth / 3, currentHeight / 4),
            SizedBox(height: currentHeight / 50),
            fillButton(LoginScreen(), "Login", Icons.login),
            fillButton(SignupScreen(), "Signup", Icons.arrow_forward),
            fillButton(
                const HomeScreen(), "as Gust", Icons.supervised_user_circle),
          ],
        ),
      ),
    );
  }
}
