import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/buttons/fill_buttons/fill_button.dart';

import '../../../core/provider/cart_provider.dart';
import '../../cart/pages/cartScreen.dart';

class Foodsinfo extends StatelessWidget {
  final Map<dynamic, dynamic> foodInfo;
  final dynamic route;

  const Foodsinfo({super.key, required this.foodInfo, required this.route});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    cartProvider.ResetBill();
    return Material(
      child: Container(
        color: AppColors.bgColor,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  AppBar(
                    leading: backIcon(Icons.arrow_back_ios, route),
                    backgroundColor: AppColors.whiteColor,
                    actions: [
                      IconButton(
                          onPressed: () {
                            cartProvider.addToCart(foodInfo);
                          },
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.orangeColor,
                          ))
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                    child: Image.asset(
                      foodInfo["img"],
                      height: 250,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 550,
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    topLeft: Radius.circular(100)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              foodInfo["name"],
                              style: TextStyle(
                                  color: AppColors.orangeColor, fontSize: 28),
                            ),
                            Text(
                              foodInfo["type"],
                              style: TextStyle(
                                  color: AppColors.grayColor, fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                      color: AppColors.brownColor,
                                      fontSize: 16),
                                ),
                                Icon(Icons.access_time_outlined,
                                    color: AppColors.brownColor)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "5 min",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Price",
                                    style: TextStyle(
                                        color: AppColors.brownColor,
                                        fontSize: 18)),
                                Icon(Icons.monetization_on,
                                    color: AppColors.brownColor)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${foodInfo["price"].toString()}  Riyals",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Rate",
                                    style: TextStyle(
                                        color: AppColors.brownColor,
                                        fontSize: 16)),
                                Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${foodInfo["rate"].toString()}",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.beigeColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cartProvider.moreItem(foodInfo);
                                        print("1+");
                                        print(foodInfo["numOfItem"]);
                                      },
                                      icon: Icon(
                                        color: AppColors.brownColor,
                                        Icons.add_circle_outlined,
                                        size: 30,
                                      )),
                                  SizedBox(width: 10),
                                  Text(
                                    foodInfo["numOfItem"].toString(),
                                    style: TextStyle(
                                        color: AppColors.brownColor,
                                        fontSize: 25),
                                  ),
                                  SizedBox(width: 10),
                                  IconButton(
                                      onPressed: () {
                                        cartProvider.lessItem(foodInfo);
                                      },
                                      icon: Icon(
                                        color: AppColors.brownColor,
                                        Icons.do_not_disturb_on,
                                        size: 30,
                                      ))
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.lightOrangeColor,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 200,
                              height: 60,
                              child: Center(
                                child: Text(
                                  "Total Price ${foodInfo["total price"]} Riyals"
                                  "",
                                  style: TextStyle(
                                      color: AppColors.brownColor,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                    FillButton(
                        text: "Make Order",
                        icon: Icons.arrow_circle_right_outlined,
                        route: Cartscreen())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
