import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';

import '../../../dimensions/myDimensions.dart';
import '../provider/bottomBar_provider.dart';

Widget bottomBarIcon(IconData icon, String lable, int index,
    BottomBarProvider bottomBarProvider, BuildContext context) {
  return InkWell(
    onTap: () {
      bottomBarProvider.updateIndex(index, context);
    },
    child: Container(
      height: dimensionHeight(0.15),
      width: dimensionWidth(0.15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bottomBarProvider.Index == index
              ? AppColors.lightGrayColor
              : Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: bottomBarProvider.Index == index
                ? AppColors.orangeColor
                : AppColors.lightGrayColor,
            size: dimensionWidth(0.08),
          ),
          Text(
            lable,
            style: TextStyle(
              fontSize: dimensionFontSize(10),
              color: bottomBarProvider.Index == index
                  ? AppColors.orangeColor
                  : AppColors.lightGrayColor,
            ),
          )
        ],
      ),
    ),
  );
}
