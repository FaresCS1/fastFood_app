import 'package:flutter/material.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/models/foodMenu_info.dart';
import '../../foods/pages/foodsInfo.dart';

class MealsWidget extends StatelessWidget {
  const MealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return SizedBox(
        height: currentHeight / 6,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: meals.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Foodsinfo(
                              foodInfo: mealsInfo[index],
                            )));
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.beigeColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: currentWidth / 1.5,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: currentHeight / 6,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/meals/${meals[index]}.png"))),
                          ),
                          Container(
                            height: currentHeight / 20,
                            width: currentWidth / 2.5,
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
