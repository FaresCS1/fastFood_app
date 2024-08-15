import 'package:flutter/material.dart';
import 'package:untitled2/features/entry/pages/login/login_screen.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';
import '../../../../core/colors/appColors.dart';
import '../../../../core/shered_widget/buttons/fill_buttons/fill_button_widget.dart';
import '../../../../core/shered_widget/buttons/text_button/textButtonWidget.dart';
import '../../../../core/shered_widget/textfiled/textFormFieldWidgte.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: currentHeight,
        width: currentWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg2.jpg"),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        )),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  AppColors.lightOrangeColor.withOpacity(0.1),
                  AppColors.lightOrangeColor.withOpacity(0.2),
                  AppColors.orangeColor.withOpacity(0.2),
                  AppColors.lightOrangeColor.withOpacity(0.7),
                  AppColors.orangeColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.mirror),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: currentHeight / 15),
            child: Column(
              children: [
                Text(
                  "Sign up",
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 60,
                      letterSpacing: 1.5,
                      wordSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: currentHeight / 8,
                ),
                TextFieldWidget(
                    Icons.person, "username", false, usernameController),
                TextFieldWidget(Icons.email, "email", false, emailController),
                TextFieldWidget(Icons.add_location_alt, "location", false,
                    locationController),
                TextFieldWidget(Icons.dialpad, "phone", false, phoneController),
                SizedBox(
                  height: currentHeight / 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButtonWidget(
                        "Login", AppColors.whiteColor, LoginScreen()),
                    TextButtonWidget(
                        "as Gust", AppColors.whiteColor, HomeScreen())
                  ],
                ),
                SizedBox(
                  height: currentHeight / 50,
                ),
                fillButton(const HomeScreen(), "Signup", Icons.arrow_forward),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
