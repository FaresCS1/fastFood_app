import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/models/app_info.dart';
import '../../../core/models/foodMenu_info.dart';
import '../../../core/shered_widget/Icons/widgets/backIcon.dart';
import '../../home/pages/home_screen.dart';
import 'foodsInfo.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          centerTitle: true,
          leading: backIcon(Icons.arrow_back_ios, HomeScreen()),
          title: Text(
            "Meals",
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Container(
          color: AppColors.bgColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 15,
              ),
              itemCount: mealsInfo.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Foodsinfo(
                                  foodInfo: mealsInfo[index],
                                  route: MealsScreen(),
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70)),
                      gradient: LinearGradient(
                          colors: [
                            AppColors.lightOrangeColor,
                            AppColors.whiteColor,
                            AppColors.whiteColor,
                            AppColors.whiteColor,
                          ],
                          tileMode: TileMode.clamp,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              image: DecorationImage(
                                  image: AssetImage(mealsInfo[index]["img"]),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: [
                            Text(
                              mealsInfo[index]["name"],
                              style: TextStyle(
                                fontSize: 28,
                                color: AppColors.orangeColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${mealsInfo[index]["price"].toString()} price",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.brownColor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      mealsInfo[index]["rate"].toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.brownColor),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellowColor,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
