import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';

Widget cardInfo(String title, String subTitle, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: AppColors.whiteColor,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: AppColors.brownColor, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subTitle,
            style: TextStyle(
                color: AppColors.brownColor, fontWeight: FontWeight.bold)),
        leading: Icon(
          icon,
          color: AppColors.orangeColor,
        ),
      ),
    ),
  );
}
