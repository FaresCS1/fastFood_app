import 'package:flutter/material.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/routes/myRoutes.dart';
import '../../foods/data/foodMenu_info.dart';

class OffersWidget extends StatelessWidget {
  final bool dirHorizontal;
  const OffersWidget({super.key, required this.dirHorizontal});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dirHorizontal ? dimensionHeight(0.25) : dimensionHeight(0.85),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: dirHorizontal ? Axis.horizontal : Axis.vertical,
          itemCount: offersList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushNamed(offersRoute);
                });
              },
              child: Padding(
                padding: dirHorizontal
                    ? EdgeInsets.symmetric(horizontal: dimensionWidth(0.02))
                    : EdgeInsets.symmetric(vertical: dimensionWidth(0.02)),
                child: Container(
                  height: dimensionHeight(0.25),
                  width: dimensionWidth(0.85),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(offersList[index]["img"]),
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.midOrangeColor,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
