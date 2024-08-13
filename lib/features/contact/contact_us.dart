import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors/appColors.dart';
import '../../core/shered_widget/Icons/widgets/backIcon.dart';
import '../../core/shered_widget/logo/logo.dart';
import '../profile/card_info.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: coustmizeIconButton(Icons.arrow_back_ios, null),
      ),
      body: Container(
        color: AppColors.bgColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      appLogo(100, 100),
                      const Text(
                        "ContactUs",
                        style: TextStyle(
                            color: AppColors.lightOrangeColor,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 700,
                  child: Column(
                    children: [
                      cardInfo("LinkedIn", "Fares omar", Icons.group),
                      cardInfo("GitHub ", "FaresCs1", Icons.developer_mode),
                      cardInfo("Email", "fares05719@gmail.com", Icons.email),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
