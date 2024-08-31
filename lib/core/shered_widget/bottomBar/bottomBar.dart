import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/provider/bottomBar_provider.dart';
import 'package:untitled2/core/shered_widget/bottomBar/iconBottomBar.dart';

import '../../classes/shared_preferences/SharedPrefHelper.dart';
import '../../dimensions/myDimensions.dart';

Widget myBottombar(BottomBarProvider bottomBar, BuildContext context) {
  return Container(
    height: dimensionHeight(0.10),
    decoration: const BoxDecoration(
      color: AppColors.whiteColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        bottomBarIcon(Icons.home, "Home", 0, bottomBar, context),
        bottomBarIcon(Icons.local_offer, "Offers", 1, bottomBar, context),
        if (SharedPrefsHelper.getBool("login")!)
          SizedBox(width: dimensionWidth(0.15)),
        bottomBarIcon(Icons.restaurant_menu, "Menu", 2, bottomBar, context),
        if (SharedPrefsHelper.getBool("login")!)
          bottomBarIcon(Icons.more_horiz, "more", 3, bottomBar, context),
      ],
    ),
  );
}
