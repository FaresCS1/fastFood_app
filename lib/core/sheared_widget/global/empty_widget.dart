import 'package:flutter/cupertino.dart';

import '../../colors/appColors.dart';
import '../../dimensions/myDimensions.dart';

Widget emptyWidget(String text, IconData icon) {
  return Container(
    height: dimensionHeight(0.75),
    alignment: AlignmentDirectional.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.orangeColor,
          size: dimensionWidth(0.20),
        ),
        Text(
          text,
          style: TextStyle(
              color: AppColors.lightOrangeColor,
              fontSize: dimensionFontSize(25)),
        )
      ],
    ),
  );
}
