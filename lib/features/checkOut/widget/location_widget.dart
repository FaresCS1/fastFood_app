import 'package:flutter/material.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';
import '../../../core/shared_preferences/SharedPrefHelper.dart';

Widget locationWidget() {
  return Container(
    height: dimensionHeight(0.25),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: AppColors.whiteColor,
        width: 2,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: dimensionHeight(0.18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/others/fake_map.png"))),
        ),
        const Divider(
          height: 5,
          color: AppColors.whiteColor,
        ),
        Container(
          height: dimensionHeight(0.05),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "Saudi - ${SharedPrefsHelper.getString("location")!}",
            style: const TextStyle(color: AppColors.greenColor, fontSize: 18),
          ),
        ),
      ],
    ),
  );
}
