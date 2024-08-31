import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/constants/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/provider/bottomBar_provider.dart';

import '../../../core/models/foodMenu_info.dart';
import '../../../core/provider/food_provider.dart';
import '../../../core/shered_widget/bottomBar/bottomBar.dart';

class MenuScreen extends StatelessWidget {
  late String type;
  MenuScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FirebaseAuth.instance.currentUser != null
          ? InkWell(
              onTap: () {
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.of(context).pushNamed(cartRoute);
                });
              },
              child: Container(
                height: dimensionHeight(0.15),
                width: dimensionWidth(0.15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orangeColor,
                ),
                child: Icon(
                  Icons.add_shopping_cart,
                  color: AppColors.whiteColor,
                  size: dimensionWidth(0.10),
                ),
              ),
            )
          : null,
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Foods",
          style: TextStyle(
              fontSize: dimensionFontSize(28),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: AppColors.orangeColor),
        ),
      ),
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) {
              final foodProvider = FoodProvider();
              foodProvider.selectedType(type);
              return foodProvider;
            }),
          ],
          child: Builder(builder: (context) {
            final foodProvider = Provider.of<FoodProvider>(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: AppColors.bgColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          height: dimensionHeight(0.06),
                          child: ListView.builder(
                              controller: foodProvider.scrollController,
                              itemCount: foodsCategory.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 10),
                                  child: InkWell(
                                    onTap: () {
                                      foodProvider.scrollToIndex(index);
                                      foodProvider.selectedType(
                                          foodsCategory[index]["type"]);
                                    },
                                    child: Container(
                                      width: dimensionWidth(0.30),
                                      decoration: BoxDecoration(
                                        color: foodProvider.type !=
                                                foodsCategory[index]["type"]
                                            ? AppColors.whiteColor
                                            : AppColors.orangeColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          foodsCategory[index]["type"],
                                          style: TextStyle(
                                              color: foodProvider.type !=
                                                      foodsCategory[index]
                                                          ["type"]
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
                        SizedBox(
                          height: dimensionHeight(0.70),
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
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                              "${foodProvider.foodItem[index]["price"].toString()} Riyals"),
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
                ),
                ChangeNotifierProvider(
                    create: (_) => BottomBarProvider(),
                    child: Consumer<BottomBarProvider>(
                        builder: (context, bottomBarProvider, _) {
                      return Builder(builder: (context) {
                        bottomBarProvider.Index = 2;
                        return myBottombar(bottomBarProvider, context);
                      });
                    }))
              ],
            );
          })),
    );
  }
}
