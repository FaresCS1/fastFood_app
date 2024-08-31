import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

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
        leading: backIcon(),
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Column(
          children: [
            SizedBox(
              height: dimensionHeight(0.20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  appLogo(dimensionWidth(0.15), dimensionHeight(0.15)),
                  Text(
                    "ContactUs",
                    style: TextStyle(
                        color: AppColors.lightOrangeColor,
                        fontSize: dimensionFontSize(28),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  cardInfo("LinkedIn", "Fares omar", Icons.group),
                  cardInfo("GitHub ", "FaresCs1", Icons.developer_mode),
                  cardInfo("Email", "alkuwaili.fares@gmail.com", Icons.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
