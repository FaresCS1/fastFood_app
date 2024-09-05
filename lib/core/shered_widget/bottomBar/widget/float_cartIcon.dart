import 'package:flutter/material.dart';
import 'package:untitled2/core/routes/myRoutes.dart';

import '../../../colors/appColors.dart';
import '../../../dimensions/myDimensions.dart';

class FloatCartIcon extends StatelessWidget {
  const FloatCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushNamed(cartRoute);
        });
      },
      child: Container(
        height: dimensionHeight(0.15),
        width: dimensionWidth(0.15),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.orangeColor,
        ),
        child: Icon(
          Icons.add_shopping_cart,
          color: AppColors.whiteColor,
          size: dimensionWidth(0.10),
        ),
      ),
    );
  }
}
