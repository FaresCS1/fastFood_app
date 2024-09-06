import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/appDimension.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import '../../../../core/provider/app_state/appState_provider.dart';
import '../../../../core/provider/user_provider/user_provider.dart';
import '../../../../core/shered_widget/buttons/auth_button/widget/auth_button_widget.dart';
import '../../../../core/shered_widget/dialog/build_dialog.dart';
import '../../../../core/shered_widget/textfiled/textFormFieldWidgte.dart';

class RestPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  RestPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BuildDialog.init(context);
    return Scaffold(
        body: Container(
      height: AppDimension.currentHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/others/bg2.jpg"),
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: dimensionHeight(0.10)),
                  child: Text(
                    "Rest Password",
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
                    SizedBox(
                      height: dimensionHeight(0.10),
                      child: Image.asset(
                        "assets/images/others/reset_password.png",
                      ),
                    ),
                    SizedBox(
                      height: dimensionHeight(0.10),
                      child: Text(
                        "Reset Password via Email",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: dimensionFontSize(20),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        "enter the email associated with your account and we will reset a new password to email",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: dimensionFontSize(20),
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    ChangeNotifierProvider(
                      create: (_) => UserProvider(),
                      child: Builder(builder: (context) {
                        final userProvider = Provider.of<UserProvider>(context);
                        return Column(
                          children: [
                            textFieldWidget(
                                Icons.email,
                                "email",
                                false,
                                userProvider.emailController,
                                userProvider.emailFormKey),
                            authButtonWidget("Reset Password", Icons.lock_reset,
                                () => userProvider.resetPassword()),
                          ],
                        );
                      }),
                    ),
                    Consumer<AppStateProvider>(
                      builder: (context, appState, child) {
                        if (appState.isConnected == false) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
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
