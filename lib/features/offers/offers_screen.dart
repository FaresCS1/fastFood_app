import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

import '../../core/shered_widget/Icons/widgets/backIcon.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text("Offers"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: AppColors.orangeColor,
            fontSize: 28,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        leading: coustmizeIconButton(Icons.arrow_back_ios, HomeScreen()),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: currentHeight / 6,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/ads_cover.jpg"),
                ),
                borderRadius: BorderRadius.circular(15),
                color: AppColors.midOrangeColor,
              ),
            ),
            SizedBox(
              height: currentHeight / 50,
            ),
            Container(
              height: currentHeight / 6,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/ads_cover.jpg"),
                ),
                borderRadius: BorderRadius.circular(15),
                color: AppColors.midOrangeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
