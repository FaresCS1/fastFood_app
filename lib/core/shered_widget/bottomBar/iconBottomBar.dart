import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/provider/bottomBar_provider.dart';

Widget bottomBarIcon(IconData icon, String lable, int index,
    BottomBarProvider bottomBarProvider, BuildContext context) {
  return InkWell(
    onTap: () {
      bottomBarProvider.OnSelectedIconBar(index, context);

      print("selected index $index");
    },
    child: Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bottomBarProvider.index == index
              ? AppColors.whiteColor
              : Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: bottomBarProvider.index == index
                ? AppColors.orangeColor
                : AppColors.whiteColor,
            size: 30,
          ),
          Text(
            lable,
            style: TextStyle(
              fontSize: 14,
              color: bottomBarProvider.index == index
                  ? AppColors.orangeColor
                  : AppColors.whiteColor,
            ),
          )
        ],
      ),
    ),
  );
}
