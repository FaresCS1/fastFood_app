import 'package:flutter/material.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/models/app_info.dart';
import '../../../core/models/user.dart';
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
                return AlertDialog(
                  title: Text('Filed Login'),
                  icon: Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: AppColors.lightRedColor,
                    size: 100,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        onHover: (value) =>
                            TextStyle(color: AppColors.grayColor),
                        child: Text("Try Agine"))
                  ],
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Success  Login'),
                  icon: Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.greenAccent,
                    size: 100,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        onHover: (value) =>
                            TextStyle(color: AppColors.grayColor),
                        child: Text("Make your first order"))
                  ],
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
