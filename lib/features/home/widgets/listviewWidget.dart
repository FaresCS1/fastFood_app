import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/features/foods/pages/foods.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/models/app_info.dart';
import '../../../core/models/foodMenu_info.dart';
import '../../foods/pages/foodsInfo.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: foodsCategory.length,
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FoodsScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: lightColors[index],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 100,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/mainCategory/${foodsCategory[index]}.png",
                            width: 80,
                            height: 80,
                          ),
                          Text(
                            "${foodsCategory[index]}",
                            style: TextStyle(
                                color: AppColors.bgColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
