import 'package:flutter/material.dart';
import 'package:untitled2/features/entry/pages/login/login_screen.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/models/app_info.dart';
import '../../../core/models/user.dart';
import '../../../core/shered_widget/dailog/dailog.dart';
import '../../home/pages/home_screen.dart';

Widget LoginButton(BuildContext context, List<Users> user,
    TextEditingController username, TextEditingController password) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: InkWell(
      onTap: () {
        for (Users users in user) {
          if (users.username == username.text) {
            curentUser = users;
          }
        }
        if (curentUser == null) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogApp(
                  title: 'Filed  Login',
                  icon: Icons.disabled_by_default,
                  color: AppColors.lightRedColor,
                  textButton: 'Try !! >>',
                  route: LoginScreen(),
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const DialogApp(
                  title: 'Success  Login',
                  icon: Icons.verified_user,
                  color: Colors.greenAccent,
                  textButton: 'Start Explore >>',
                  route: HomeScreen(),
                );
              });
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: [
                AppColors.lightRedColor,
                AppColors.midOrangeColor,
                AppColors.lightOrangeColor
              ],
              tileMode: TileMode.mirror),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  color: AppColors.bgColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.login,
              color: AppColors.bgColor,
            )
          ],
        ),
      ),
    ),
  );
}
