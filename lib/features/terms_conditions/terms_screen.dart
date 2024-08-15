import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/features/more/pages/more_screen.dart';

import '../../core/colors/appColors.dart';
import '../../core/shered_widget/Icons/widgets/backIcon.dart';
import '../../core/shered_widget/logo/logo.dart';
import 'bulletTextWidget.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: coustmizeIconButton(Icons.arrow_back_ios, MoreScreen()),
      ),
      body: Container(
        color: AppColors.bgColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                SizedBox(
                  height: currentHeight / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      appLogo(currentWidth / 3, currentHeight / 8),
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
                SizedBox(height: currentHeight / 100),
                SizedBox(
                  height: currentHeight / 1.5,
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
