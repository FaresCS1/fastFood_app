import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/constants/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/provider/user_provider.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/buttons/border_boutton/widget/auth_button_.dart';

import '../../core/classes/shared_preferences/SharedPrefHelper.dart';
import '../../core/shered_widget/dialog/customized_dialog.dart';
import 'card_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.bgColor,
          actions: [
            ChangeNotifierProvider(
              create: (_) => UserProvider(),
              child: Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  return authButton(
                      "Sign Out",
                      Icons.exit_to_app,
                      () => showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return ConfirmDialog(
                                content: "are you sure to sign out ?",
                                fun: userProvider.signOut,
                                title: "SignOut",
                                textButton: "SignOut",
                                route: homeRoute,
                                icon: Icons.exit_to_app,
                                color: AppColors.redColor);
                          }));
                },
              ),
            )
          ],
          leading: backIcon(),
          title: Text(
            "Profile Information",
            style: TextStyle(
                color: AppColors.lightOrangeColor,
                fontSize: dimensionFontSize(24),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: AppColors.bgColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Welcome , ${SharedPrefsHelper.getString("fullName")!}",
                        style: TextStyle(
                          fontSize: dimensionFontSize(22),
                          fontWeight: FontWeight.bold,
                          color: AppColors.brownColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    cardInfo("Email", SharedPrefsHelper.getString("email")!,
                        Icons.email),
                    cardInfo("Phone", SharedPrefsHelper.getString("phone")!,
                        Icons.phone),
                    cardInfo(
                        "Address",
                        SharedPrefsHelper.getString("location")!,
                        Icons.add_location_alt),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
