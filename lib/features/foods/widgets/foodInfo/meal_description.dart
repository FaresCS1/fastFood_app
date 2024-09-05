import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors/appColors.dart';
import '../../../../core/dimensions/myDimensions.dart';

Widget mealDescription(Map<dynamic, dynamic> foodInfo) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                foodInfo["name"],
                style: TextStyle(
                    color: AppColors.orangeColor,
                    fontWeight: FontWeight.w500,
                    fontSize: dimensionFontSize(24)),
              ),
              Text(
                foodInfo["type"],
                style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: dimensionFontSize(20)),
              )
            ],
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Time",
                    style: TextStyle(
                        color: AppColors.brownColor,
                        fontSize: dimensionFontSize(18)),
                  ),
                  const Icon(Icons.access_time_outlined,
                      color: AppColors.brownColor)
                ],
              ),
              SizedBox(
                height: dimensionHeight(0.02),
              ),
              Text(
                "5 min",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: dimensionFontSize(18)),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text("Price",
                      style: TextStyle(
                          color: AppColors.brownColor,
                          fontSize: dimensionFontSize(18))),
                  const Icon(Icons.monetization_on, color: AppColors.brownColor)
                ],
              ),
              SizedBox(
                height: dimensionHeight(0.02),
              ),
              Text(
                "${foodInfo["price"].toString()}  Riyals",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: dimensionFontSize(18)),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text("Rate",
                      style: TextStyle(
                          color: AppColors.brownColor,
                          fontSize: dimensionFontSize(18))),
                  const Icon(
                    Icons.star,
                    color: AppColors.yellowColor,
                  )
                ],
              ),
              SizedBox(
                height: dimensionHeight(0.02),
              ),
              Text(
                foodInfo["rate"].toString(),
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: dimensionFontSize(18)),
              )
            ],
          ),
        ],
      ),
    ],
  );
}
