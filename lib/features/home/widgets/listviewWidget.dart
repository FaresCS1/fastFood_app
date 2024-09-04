import 'package:flutter/material.dart';
import 'package:untitled2/core/routes/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import '../../../core/colors/appColors.dart';
import '../../foods/data/foodMenu_info.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: dimensionHeight(0.15),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              final int startIndex = 2;
              final int actualIndex = index + startIndex;
              return InkWell(
                onTap: () {
                  print(foodsCategory[actualIndex]["type"]);
                  Navigator.of(context).pushNamed(menuRoute,
                      arguments: foodsCategory[actualIndex]["type"]);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: dimensionWidth(0.02)),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: dimensionHeight(0.02)),
                    decoration: BoxDecoration(
                      color: lightColors[index],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: dimensionWidth(0.25),
                    child: Column(
                      children: [
                        SizedBox(
                          height: dimensionHeight(0.07),
                          child: Image.asset(
                            foodsCategory[actualIndex]["img"],
                          ),
                        ),
                        SizedBox(
                          height: dimensionHeight(0.03),
                          child: Text(
                            foodsCategory[actualIndex]["type"],
                            style: TextStyle(
                                color: AppColors.bgColor,
                                fontWeight: FontWeight.w500,
                                fontSize: dimensionFontSize(18)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
