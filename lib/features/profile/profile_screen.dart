import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/models/app_info.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

import 'card_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        leading: backIcon(Icons.arrow_back, HomeScreen()),
        title: const Text(
          "Profile Information",
          style: TextStyle(
              color: AppColors.lightOrangeColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: AppColors.bgColor,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      curentUser!.username,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.brownColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      curentUser!.name,
                      style: TextStyle(
                          fontSize: 16, color: AppColors.lightOrangeColor),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  cardInfo("Email", curentUser!.email, Icons.email),
                  cardInfo("Phone", curentUser!.phone, Icons.phone),
                  cardInfo("Address", curentUser!.address["city"],
                      Icons.add_location_alt),
                  cardInfo("Address", curentUser!.address["street"],
                      Icons.add_location_alt),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
