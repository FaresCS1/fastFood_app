import 'package:flutter/material.dart';
import 'package:untitled2/features/foods/provider/food_provider.dart';

import '../../../../core/colors/appColors.dart';
import '../../../../core/dimensions/myDimensions.dart';
import '../../../../core/routes/myRoutes.dart';

Widget foodMenu(FoodProvider foodProvider) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
    ),
    itemCount: foodProvider.foodItem.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(foodInfoRoute,
              arguments: foodProvider.foodItem[index]);
        },
        child: Card(
          color: AppColors.whiteColor,
          child: Column(
            children: [
              Image.asset(
                foodProvider.foodItem[index]["img"],
                width: dimensionWidth(0.30),
                height: dimensionHeight(0.13),
              ),
              SizedBox(
                child: Text(
                  foodProvider.foodItem[index]["name"],
                  style: const TextStyle(
                      color: AppColors.orangeColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${foodProvider.foodItem[index]["price"].toString()} Riyals",
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: dimensionFontSize(16)),
                  ),
                  Row(
                    children: [
                      Text(foodProvider.foodItem[index]["rate"].toString(),
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: dimensionFontSize(16))),
                      const Icon(
                        Icons.star,
                        color: AppColors.yellowColor,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
