import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/dimensions/appDimension.dart';
import 'package:untitled2/core/routes/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/features/auth/signUp/provider/signUp_provider.dart';
import '../../../../core/colors/appColors.dart';
import '../../../../core/provider/app_state/appState_provider.dart';
import '../../../../core/sheared_widget/buttons/auth_button/widget/auth_button_widget.dart';
import '../../../../core/sheared_widget/buttons/text_button/textButtonWidget.dart';
import '../../../../core/sheared_widget/dialog/build_dialog.dart';
import '../../../../core/sheared_widget/textField/textFieldWidget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
            padding: const EdgeInsets.all(20),
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
                ChangeNotifierProvider(
                    create: (_) => SignUpProvider(),
                    child: Builder(builder: (context) {
                      final signUpProvider =
                          Provider.of<SignUpProvider>(context);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          textFieldWidget(
                              Icons.person,
                              "full name",
                              false,
                              signUpProvider.nameController,
                              signUpProvider.nameFormKey),
                          textFieldWidget(
                              Icons.email,
                              "email",
                              false,
                              signUpProvider.emailController,
                              signUpProvider.emailFormKey),
                          textFieldWidget(
                              Icons.password,
                              "password",
                              false,
                              signUpProvider.passwordController,
                              signUpProvider.passwordFormKey),
                          DropdownMenu<String>(
                            width: double.infinity,
                            enableSearch: true,
                            hintText: "select your city",
                            inputDecorationTheme: InputDecorationTheme(
                              hintStyle:
                                  const TextStyle(color: AppColors.grayColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              filled: true,
                              fillColor: AppColors.beigeColor,
                            ),
                            leadingIcon: const Icon(Icons.add_location_alt,
                                color: AppColors.midOrangeColor, size: 28),
                            menuStyle: const MenuStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(AppColors.beigeColor),
                              alignment: AlignmentDirectional.bottomCenter,
                            ),
                            onSelected: (String? value) {
                              signUpProvider.setCity(value);
                            },
                            dropdownMenuEntries: signUpProvider.cities
                                .map<DropdownMenuEntry<String>>((String value) {
                              return DropdownMenuEntry<String>(
                                  value: value, label: value);
                            }).toList(),
                          ),
                          textFieldWidget(
                              Icons.dialpad,
                              "phone",
                              false,
                              signUpProvider.phoneController,
                              signUpProvider.phoneFormKey),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButtonWidget(
                                  "Login", AppColors.whiteColor, loginRoute),
                              TextButtonWidget(
                                  "as Gust", AppColors.whiteColor, homeRoute)
                            ],
                          ),
                          authButtonWidget(
                              "Create Account",
                              Icons.account_circle_outlined,
                              () => signUpProvider.signUp()),
                          Consumer<AppStateProvider>(
                            builder: (context, appState, child) {
                              if (appState.isConnected == false) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
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
                              }
                              return Container();
                            },
                          ),
                        ],
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
