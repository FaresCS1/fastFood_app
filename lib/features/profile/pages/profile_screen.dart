import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/provider/user_provider/user_provider.dart';
import 'package:untitled2/core/sheared_widget/Icon_button/widgets/backIcon.dart';
import 'package:untitled2/core/sheared_widget/dialog/build_dialog.dart';

import '../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../../core/sheared_widget/buttons/auth_button/widget/auth_button_widget.dart';
import '../../../core/sheared_widget/global/card_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BuildDialog.init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.bgColor,
          actions: [
            ChangeNotifierProvider(
              create: (_) => UserProvider(),
              child: Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  return authButtonWidget("Sign Out", Icons.exit_to_app,
                      () => userProvider.confirmSignOut());
                },
              ),
            )
          ],
          leading: backIcon(),
          title: Text(
            "Profile",
            style: TextStyle(
                color: AppColors.orangeColor,
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
                          color: AppColors.orangeColor,
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
