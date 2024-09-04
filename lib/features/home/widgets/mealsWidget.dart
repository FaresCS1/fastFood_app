import 'package:flutter/material.dart';
import 'package:untitled2/core/routes/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import '../../../core/colors/appColors.dart';
import '../../foods/data/foodMenu_info.dart';

class MealsWidget extends StatelessWidget {
  const MealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: mealsInfo.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(foodInfoRoute, arguments: mealsInfo[index]);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: dimensionHeight(0.01)),
                  child: Container(
                      height: dimensionHeight(0.15),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: dimensionHeight(0.15),
                            width: dimensionWidth(0.60),
                            child: Image.asset(
                              mealsInfo[index]["img"],
                              width: dimensionWidth(0.60),
                            ),
                          ),
                          Container(
                            height: dimensionHeight(0.15),
                            width: dimensionWidth(0.30),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7),
                                    topRight: Radius.circular(7)),
                                color: AppColors.whiteColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.fastfood,
                                      color: AppColors.orangeColor,
                                      size: dimensionWidth(0.05),
                                    ),
                                    SizedBox(
                                      width: dimensionWidth(0.20),
                                      child: Text(
                                        "${mealsInfo[index]["name"]} meal",
                                        style: TextStyle(
                                            fontSize: dimensionFontSize(14),
                                            color: AppColors.orangeColor),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellowColor,
                                      size: dimensionWidth(0.05),
                                    ),
                                    SizedBox(
                                        width: dimensionWidth(0.20),
                                        child: Text(
                                          "4.5",
                                          style: TextStyle(
                                              fontSize: dimensionFontSize(14),
                                              color: AppColors.orangeColor),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              );
            }));
  }
}
