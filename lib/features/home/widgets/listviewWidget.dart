import 'package:flutter/material.dart';
import 'package:untitled2/features/foods/pages/foods.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/models/foodMenu_info.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return SizedBox(
        height: currentHeight / 6.5,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              final int startIndex = 2;
              final int actualIndex = index + startIndex;
              return InkWell(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodsScreen(
                                  type: foodsCategory[actualIndex]["type"],
                                )));
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: lightColors[index],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: currentWidth / 4.25,
                    child: Column(
                      children: [
                        Image.asset(
                          foodsCategory[actualIndex]["img"],
                          width: currentWidth / 4,
                          height: currentHeight / 12,
                        ),
                        Text(
                          foodsCategory[actualIndex]["type"],
                          style: const TextStyle(
                              color: AppColors.bgColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
