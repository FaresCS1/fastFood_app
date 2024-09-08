import 'package:flutter/material.dart';
import 'package:untitled2/features/foods/provider/food_provider.dart';

import '../../../../core/colors/appColors.dart';
import '../../../../core/dimensions/myDimensions.dart';
import '../../data/foodMenu_info.dart';

Widget foodCategoryScroll(FoodProvider foodProvider) {
  return SizedBox(
    height: dimensionHeight(0.06),
    child: ListView.builder(
        controller: foodProvider.scrollController,
        itemCount: foodsCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                foodProvider.scrollToIndex(index);
                foodProvider.selectedType(foodsCategory[index]["type"]);
              },
              child: Container(
                width: dimensionWidth(0.30),
                decoration: BoxDecoration(
                  color: foodProvider.type != foodsCategory[index]["type"]
                      ? AppColors.whiteColor
                      : AppColors.orangeColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    foodsCategory[index]["type"],
                    style: TextStyle(
                        color: foodProvider.type != foodsCategory[index]["type"]
                            ? AppColors.grayColor
                            : AppColors.whiteColor,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          );
        }),
  );
}
