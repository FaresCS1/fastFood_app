import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/constants/appDimension.dart';
import 'package:untitled2/core/constants/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import '../../../../core/colors/appColors.dart';
import '../../../../core/provider/appState_provider.dart';
import '../../../../core/provider/user_provider.dart';
import '../../../../core/shered_widget/buttons/border_boutton/widget/auth_button_.dart';
import '../../../../core/shered_widget/buttons/text_button/textButtonWidget.dart';
import '../../../../core/shered_widget/textfiled/textFormFieldWidgte.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        body: Container(
      height: AppDimension.currentHeight,
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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: dimensionHeight(0.10)),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: dimensionFontSize(40),
                        letterSpacing: 1.5,
                        wordSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Column(
                  children: [
                    textFieldWidget(Icons.person, "full name", false,
                        userProvider.nameController, userProvider.nameFormKey),
                    SizedBox(height: dimensionHeight(0.015)),
                    textFieldWidget(
                        Icons.email,
                        "email",
                        false,
                        userProvider.emailController,
                        userProvider.emailFormKey),
                    SizedBox(height: dimensionHeight(0.015)),
                    textFieldWidget(
                        Icons.password,
                        "password",
                        false,
                        userProvider.passwordController,
                        userProvider.passwordFormKey),
                    SizedBox(height: dimensionHeight(0.015)),
                    textFieldWidget(
                        Icons.add_location_alt,
                        "location",
                        false,
                        userProvider.locationController,
                        userProvider.locationFormKey),
                    SizedBox(height: dimensionHeight(0.015)),
                    textFieldWidget(
                        Icons.dialpad,
                        "phone",
                        false,
                        userProvider.phoneController,
                        userProvider.phoneFormKey),
                    SizedBox(height: dimensionHeight(0.015)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButtonWidget(
                            "Login", AppColors.whiteColor, loginRoute),
                        TextButtonWidget(
                            "as Gust", AppColors.whiteColor, homeRoute)
                      ],
                    ),
                    authButton("Create Account", Icons.account_circle_outlined,
                        () => userProvider.signUp(context)),
                    Consumer<AppStateProvider>(
                      builder: (context, appState, child) {
                        if (appState.isConnected == false) {
                          Future.delayed(Duration.zero, () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Center(
                                  child: Text(
                                " No Internet Connection",
                                style: TextStyle(color: AppColors.whiteColor),
                              )),
                              duration: Duration(seconds: 5),
                              backgroundColor: AppColors.redColor,
                            ));
                          });
                          return Container();
                        }
                        return Container();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
