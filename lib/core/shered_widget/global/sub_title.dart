import 'package:flutter/cupertino.dart';

import '../../colors/appColors.dart';
import '../../dimensions/myDimensions.dart';

Widget subTitle(String subtitle) {
  return Text(
    subtitle,
    style: TextStyle(
      color: AppColors.blackColor,
      fontSize: dimensionFontSize(22),
      fontWeight: FontWeight.w500,
    ),
  );
}
