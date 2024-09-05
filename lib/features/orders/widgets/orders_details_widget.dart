import 'package:flutter/cupertino.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';

Widget orderDetailsWidget(Map<String, dynamic> item) {
  return Container(
    height: dimensionHeight(0.20),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          item["img"],
          height: dimensionHeight(0.15),
          width: dimensionWidth(0.25),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item["name"],
              style: TextStyle(
                  color: AppColors.orangeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: dimensionFontSize(18)),
            ),
            Row(
              children: [
                Text(
                  "Number of item : ",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: dimensionFontSize(14)),
                ),
                Text(
                  item["numOfItem"].toString(),
                  style: TextStyle(
                      color: AppColors.orangeColor,
                      fontSize: dimensionFontSize(14)),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Item Price : ",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: dimensionFontSize(14)),
                ),
                Text(
                  item["price"].toString(),
                  style: TextStyle(
                      color: AppColors.orangeColor,
                      fontSize: dimensionFontSize(14)),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Total Price : ",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: dimensionFontSize(14)),
                ),
                Text(
                  item["total price"].toString(),
                  style: TextStyle(
                      color: AppColors.orangeColor,
                      fontSize: dimensionFontSize(14)),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
