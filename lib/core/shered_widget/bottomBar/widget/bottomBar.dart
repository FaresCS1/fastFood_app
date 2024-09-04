import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/bottomBar/provider/bottomBar_provider.dart';
import 'package:untitled2/core/shered_widget/bottomBar/widget/iconBottomBar.dart';

import '../../../dimensions/myDimensions.dart';

Widget myBottomBar(BottomBarProvider bottomBar, BuildContext context) {
  return Container(
    height: dimensionHeight(0.10),
    decoration: const BoxDecoration(
      color: AppColors.whiteColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        bottomBarIcon(Icons.home, "Home", 0, bottomBar, context),
        bottomBarIcon(Icons.delivery_dining, "Orders", 1, bottomBar, context),
        if (FirebaseAuth.instance.currentUser != null)
          SizedBox(width: dimensionWidth(0.15)),
        bottomBarIcon(Icons.restaurant_menu, "Menu", 2, bottomBar, context),
        if (FirebaseAuth.instance.currentUser != null)
          bottomBarIcon(Icons.more_horiz, "more", 3, bottomBar, context),
      ],
    ),
  );
}
