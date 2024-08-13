import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/models/app_info.dart';
import 'package:untitled2/core/provider/bottomBar_provider.dart';
import 'package:untitled2/core/shered_widget/bottomBar/iconBottomBar.dart';

Widget myBottombar(BottomBarProvider bottomBar, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      height: 90,
      decoration: BoxDecoration(
          color: AppColors.orangeColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: AppColors.lightOrangeColor,
                offset: Offset.zero,
                blurRadius: 15,
                blurStyle: BlurStyle.outer)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomBarIcon(Icons.home, "Home", 0, bottomBar, context),
          bottomBarIcon(Icons.reorder, "Orders", 1, bottomBar, context),
          bottomBarIcon(Icons.add_shopping_cart, "Cart", 2, bottomBar, context),
          if (curentUser != null)
            bottomBarIcon(Icons.more, "more", 3, bottomBar, context),
        ],
      ),
    ),
  );
}
