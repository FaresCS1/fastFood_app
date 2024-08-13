import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/models/foodMenu_info.dart';

Widget foodType() {
  return Container(
    height: 50,
    child: ListView.builder(
        itemCount: foodsCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    foodsCategory[index]["type"],
                    style: TextStyle(color: AppColors.grayColor, fontSize: 16),
                  ),
                ),
              ),
            ),
          );
        }),
  );
}
