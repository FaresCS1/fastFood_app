import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        "Terms and \n Condition",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
