import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/features/foods/pages/foodsInfo.dart';

import '../../../core/models/foodMenu_info.dart';
import '../../../core/provider/food_provider.dart';

class FoodsScreen extends StatelessWidget {
  final String type1;
  const FoodsScreen({super.key, required this.type1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        leading: coustmizeIconButton(Icons.arrow_back_ios, null),
        title: const Text(
          "Foods",
          style: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) {
          final foodProvider = FoodProvider();
          foodProvider.selectedType(type1);
          return foodProvider;
        },
        child: Builder(
          builder: (context) {
            final foodProvider = Provider.of<FoodProvider>(context);
            return Container(
              color: AppColors.bgColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: ListView.builder(
                          controller: foodProvider.scrollController,
                          itemCount: foodsCategory.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  foodProvider.scrollToIndex(index);
                                  foodProvider.selectedType(
                                      foodsCategory[index]["type"]);
                                },
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: foodProvider.typea !=
                                            foodsCategory[index]["type"]
                                        ? AppColors.whiteColor
                                        : AppColors.orangeColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      foodsCategory[index]["type"],
                                      style: TextStyle(
                                          color: foodProvider.typea !=
                                                  foodsCategory[index]["type"]
                                              ? AppColors.grayColor
                                              : AppColors.whiteColor,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: foodProvider.foodItem.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Foodsinfo(
                                            foodInfo:
                                                foodProvider.foodItem[index])));
                              });
                            },
                            child: Card(
                              color: AppColors.whiteColor,
                              child: Column(
                                children: [
                                  Image.asset(
                                    foodProvider.foodItem[index]["img"],
                                    width: 130,
                                    height: 130,
                                  ),
                                  Text(
                                    foodProvider.foodItem[index]["name"],
                                    style: const TextStyle(
                                      color: AppColors.orangeColor,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          "${foodProvider.foodItem[index]["price"].toString()} price"),
                                      Row(
                                        children: [
                                          Text(foodProvider.foodItem[index]
                                                  ["rate"]
                                              .toString()),
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
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
