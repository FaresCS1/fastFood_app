import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/logo/logo.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColors.bgColor,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      appLogo(100, 100),
                      Text(
                        "Fast food \n faster smiles!",
                        style: TextStyle(
                            color: AppColors.lightOrangeColor,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("Mnue"),
                        titleTextStyle: TextStyle(fontSize: 30),
                        trailing: coustmizeIconButton(
                            Icons.next_plan_sharp, AppColors.orangeColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
