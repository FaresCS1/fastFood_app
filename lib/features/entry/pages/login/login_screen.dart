import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/constants/appDimension.dart';
import 'package:untitled2/core/constants/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/provider/appState_provider.dart';
import 'package:untitled2/core/provider/login_provider.dart';
import 'package:untitled2/core/provider/user_provider.dart';
import '../../../../core/shered_widget/buttons/border_boutton/widget/auth_button_.dart';
import '../../../../core/shered_widget/buttons/text_button/textButtonWidget.dart';
import '../../../../core/shered_widget/textfiled/textFormFieldWidgte.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppDimension.currentHeight,
        decoration: const BoxDecoration(
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
              height: AppDimension.currentHeight,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: dimensionHeight(0.10)),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: dimensionFontSize(40),
                          letterSpacing: 1.5,
                          wordSpacing: 2,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  ChangeNotifierProvider(
                    create: (_) => LoginProvider(),
                    child: Builder(builder: (context) {
                      final loginProvider = Provider.of<LoginProvider>(context);
                      return Column(
                        children: [
                          textFieldWidget(
                              Icons.email,
                              "email",
                              false,
                              loginProvider.emailController,
                              loginProvider.emailFormKey),
                          SizedBox(height: dimensionHeight(0.015)),
                          textFieldWidget(
                              Icons.password,
                              "password",
                              false,
                              loginProvider.passwordController,
                              loginProvider.passwordFormKey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButtonWidget(
                                  "Sign up", AppColors.whiteColor, signUpRoute),
                              TextButtonWidget(
                                  "as Gust", AppColors.whiteColor, homeRoute)
                            ],
                          ),
                          TextButtonWidget("forget password ..?",
                              AppColors.whiteColor, restPasswordRoute),
                          authButton("Login", Icons.login,
                              () => loginProvider.login(context)),
                          Consumer<AppStateProvider>(
                            builder: (context, appState, child) {
                              if (appState.isConnected == false) {
                                Future.delayed(Duration.zero, () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Center(
                                        child: Text(
                                      " No Internet Connection",
                                      style: TextStyle(
                                          color: AppColors.whiteColor),
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
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
