import 'package:flutter/material.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/models/foodMenu_info.dart';
import '../../foods/pages/foodsInfo.dart';

class MealsWidget extends StatelessWidget {
  const MealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: meals.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Foodsinfo(
                            foodInfo: mealsInfo[index],
                            route: const HomeScreen(),
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.beigeColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 300,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/meals/${meals[index]}.png"))),
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7),
                                    topRight: Radius.circular(7)),
                                color: AppColors.brownColor),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(
                                  Icons.fastfood,
                                  color: AppColors.bgColor,
                                ),
                                Text(
                                  "${meals[index]} meal",
                                  style: const TextStyle(
                                      fontSize: 16, color: AppColors.bgColor),
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
