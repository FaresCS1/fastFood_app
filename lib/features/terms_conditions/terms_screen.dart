import 'package:flutter/material.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import '../../core/colors/appColors.dart';
import '../../core/shered_widget/Icons/widgets/backIcon.dart';
import '../../core/shered_widget/logo/logo.dart';
import 'bulletTextWidget.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

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
                    "Terms and \n Condition",
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
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pointText(
                          'Please maintain respect and kindness when dealing with customers and staff.'),
                      pointText(
                          'Ensure cleanliness and adherence to food safety standards.'),
                      pointText(
                          'Employees must wear clean and appropriate work attire.'),
                      pointText(
                          'Focus on food quality and provide a unique dining experience for customers.'),
                      pointText(
                          'All customers are expected to exhibit appropriate behavior within the restaurant premises.'),
                      pointText(
                          'Kindly report any issues or complaints to the management team for efficient resolution.'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
